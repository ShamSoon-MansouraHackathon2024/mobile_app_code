import 'package:bloc/bloc.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/login.dart';
import 'package:shamsoon/src/features/auth/data/data_source/models/resgistes_model.dart';
import 'package:shamsoon/src/features/auth/data/repo/auth_repo.dart';
import 'package:shamsoon/src/features/auth/presentation/bloc/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repo) : super(AuthState.initial());
  AuthRepo repo;
  Future<void> login(LoginModel model)async{
    emit(state.copyWith(state: AuthStates.loginLoading));

    final result = await repo.login(model);
    result.when(
            (success) => emit(state.copyWith(state: AuthStates.loginSuccess)),
            (error) => emit(state.copyWith(state: AuthStates.loginError)),

    );
  }

  Future<void> signUp(RegisterModel model)async{
    emit(state.copyWith(state: AuthStates.registerLoading));

    final result = await repo.signUp(model);
    result.when(
          (success) => emit(state.copyWith(state: AuthStates.registerSuccess)),
          (error) => emit(state.copyWith(state: AuthStates.registerError)),

    );
  }
}
