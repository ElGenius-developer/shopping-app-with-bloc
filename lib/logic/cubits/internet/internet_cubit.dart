import 'dart:async';

import 'package:bag_app/data/constants/enum.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>  {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;

  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }
  StreamSubscription <ConnectivityResult>monitorInternetConnection(){

    return connectivityStreamSubscription= connectivity.onConnectivityChanged.listen((connectionResult) {
      switch(connectionResult) {
        case ConnectivityResult.wifi:
          emitConnectedState(ConnectionType.wifi);
          break;
        case ConnectivityResult.mobile:
          emitConnectedState(ConnectionType.mobile);
          break;
        case ConnectivityResult.none:
          emitDisconnected();
          break;
      }
    });
  }
 void emitConnectedState(ConnectionType _connectionType)=>
     emit(InternetConnected(connectionType: _connectionType));
 void emitDisconnected()=>emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
