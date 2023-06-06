import 'package:flutter/services.dart';

MethodChannel getDelegatorChannel() {
  return const MethodChannel('dev.masel.synced_bloc.delegator');
}

MethodChannel getMasterChannel({required String masterId}) {
  return MethodChannel('dev.masel.synced_bloc.master.$masterId');
}

MethodChannel getSubscriberChannel(
    {required String masterId, required String subscriberId}) {
  return MethodChannel(
      'dev.masel.synced_bloc.subscriber.$masterId.$subscriberId');
}
