import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_bloc/src/utils.dart';

mixin SyncMasterMixin<Event, State> on Bloc<Event, State> {
  late final String _masterId;

  /// masterId required to be unique within app
  void setupSyncMaster({
    required String masterId,
    required Map<String, dynamic> Function(State state) stateToJson,
    required Event Function(Map<String, dynamic> json) eventFromJson,
  }) {
    _masterId = masterId;
    getDelegatorChannel()
        .invokeMethod('registerMaster', {'masterId': masterId});
    getMasterChannel(masterId: masterId).setMethodCallHandler((call) async {
      switch (call.method) {
        case 'getState':
          String str = jsonEncode(stateToJson(state));
          return str;
        case 'addEvent':
          add(eventFromJson(jsonDecode(call.arguments)));
          return null;
        default:
          throw UnimplementedError();
      }
    });
  }

  @override
  Future<void> close() {
    getDelegatorChannel()
        .invokeMethod('unregisterMaster', {'masterId': _masterId});
    getMasterChannel(masterId: _masterId).setMethodCallHandler(null);
    return super.close();
  }

  @override
  void onChange(Change<State> change) {
    getDelegatorChannel().invokeMethod('notifyChange', {'masterId': _masterId});
    super.onChange(change);
  }
}

mixin SyncSubscriberMixin<Event, State> on Bloc<Event, State> {
  late final String _masterId;
  late final String _subscriberId;
  late final Map<String, dynamic> Function(Event event)? _eventToJson;

  /// (masterId, subscriberId) required to be unique within app
  void setupSyncSubscriber({
    required String masterId,
    required String subscriberId,
    required State Function(Map<String, dynamic> json) stateFromJson,
    required Map<String, dynamic> Function(Event event) eventToJson,
  }) async {
    _masterId = masterId;
    _subscriberId = subscriberId;
    _eventToJson = eventToJson;
    getDelegatorChannel().invokeMethod('registerSubscriber',
        {'masterId': masterId, 'subscriberId': subscriberId});
    getSubscriberChannel(masterId: masterId, subscriberId: subscriberId)
        .setMethodCallHandler((call) async {
      switch (call.method) {
        case 'notifyMasterChange':
          _sync(stateFromJson);
          return null;
        default:
          throw UnimplementedError();
      }
    });
    _sync(stateFromJson);
  }

  @override
  Future<void> close() {
    getDelegatorChannel().invokeMethod('unregisterSubscriber',
        {'masterId': _masterId, 'subscriberId': _subscriberId});
    getSubscriberChannel(masterId: _masterId, subscriberId: _subscriberId)
        .setMethodCallHandler(null);
    return super.close();
  }

  static Future getMasterState(
      {required String masterId,
      required Function(Map<String, dynamic>) fromJson}) async {
    String res = await getDelegatorChannel()
        .invokeMethod('getState', {'masterId': masterId});
    return fromJson(jsonDecode(res));
  }

  Future<void> _sync(State Function(Map<String, dynamic>) fromJson) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(await getMasterState(masterId: _masterId, fromJson: fromJson));
  }

  @override
  void add(Event event) {
    String str = jsonEncode(_eventToJson!.call(event));
    getDelegatorChannel()
        .invokeMethod('addEvent', {'masterId': _masterId, 'event': str});
  }

  void setupSyncMaster({
    required String masterId,
    required Map<String, dynamic> Function(State state) stateToJson,
    required Event Function(Map<String, dynamic> json) eventFromJson,
  }) {
    throw 'Use setupSyncSubscriber()';
  }
}
