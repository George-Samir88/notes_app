import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(bloc.toString());
    debugPrint(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Closed ${bloc.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('created ${bloc.toString()}');
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
