import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/common/snackbar/my_snackbar.dart';
import 'package:recipe_app/feature/auth/domain/use_case/login_use_usecase.dart';
import 'package:recipe_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
import 'package:recipe_app/feature/home/presentation/view/home_view.dart';
import 'package:recipe_app/feature/home/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegistrationBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegistrationBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _registerBloc),
              ],
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<NavigateHomeScreenEvent>(
      (event, emit) {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _homeCubit,
              child: event.destination,
            ),
          ),
        );
      },
    );

    on<LoginCustomerEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));

        // You can skip the actual authentication logic and always show success.
        // In a real app, you'd replace this with your actual login logic.

        // Emitting success state directly
        emit(state.copyWith(isLoading: false, isSuccess: true));

        // Show success Snackbar
        showMySnackBar(
          context: event.context,
          message: "Login Successful!",
          color: Colors.green,
        );

        // Navigate to HomeView (successful login)
        add(
          NavigateHomeScreenEvent(
            context: event.context,
            destination: const HomeView(),
          ),
        );
      },
    );
  }
}
