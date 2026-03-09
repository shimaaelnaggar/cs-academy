import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('On Change : ${bloc.runtimeType}');
    print('current State : ${change.currentState}');
    print('next state ${change.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('On Error : ${bloc.runtimeType}');
    print('error : ${error}');
    super.onError(bloc, error, stackTrace);
  }
}
