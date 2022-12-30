import 'package:flutter/services.dart';

MethodChannel getDelegatorChannel() {
  return const MethodChannel('dev.masel.synced_bloc.delegator');
}

MethodChannel getMasterChannel({required String masterId}) {
  return MethodChannel('dev.masel.synced_bloc.master.$masterId');
}

MethodChannel getSlaveChannel(
    {required String masterId, required String slaveId}) {
  return MethodChannel('dev.masel.synced_bloc.slave.$masterId.$slaveId');
}
