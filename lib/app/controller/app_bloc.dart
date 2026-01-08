import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:happy_money/app/controller/app_event.dart';

abstract class AppBloc<Event, State> extends Bloc<Event, State>
    with Sender<AppEvent> {
  AppBloc(super.initialState);

  // BuildContext get context => AppRouteObserver().context;

  @protected
  void broadcastAppEvent(AppEvent event) => send(event);
}
