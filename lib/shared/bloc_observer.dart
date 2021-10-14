import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    //print('onCreate -- ${bloc.runtimeType}');
    return ;
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //print('onChange -- ${bloc.runtimeType}, $change');
    return ;
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    //print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
    return ;
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    return ;
   // print('onClose -- ${bloc.runtimeType}');
  }
}