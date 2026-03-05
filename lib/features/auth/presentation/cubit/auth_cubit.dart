
import 'package:cs_academy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (error) => emit(LoginErrorState(error)),
      (_) => emit(LoginSuccessState()),
    );
  }


  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(email: email, password: password);
    result.fold(
      (error) => emit(SignUpErrorState(error)),
      (_) => emit(SignUpSuccessState()),
    );
  }
}
