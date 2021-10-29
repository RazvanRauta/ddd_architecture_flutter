import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ddd_architecture_flutter/domain/auth/auth_failure.dart';
import 'package:ddd_architecture_flutter/domain/auth/i_auth_facade.dart';
import 'package:ddd_architecture_flutter/domain/auth/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RegisterWithCredentialsPressed>(_onRegisterWithCredentials);
    on<SignInWithCredentialsPressed>(_onSignInWithCredentials);
    on<SignInWithGooglePressed>(_onSignInWithGoogle);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(
      emailAddress: EmailAddress(event.emailStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(
      password: Password(event.passwordStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onRegisterWithCredentials(RegisterWithCredentialsPressed event,
      Emitter<SignInFormState> emit) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      ));
    } else {
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        showErrorMessages: true,
      ));
    }
  }

  void _onSignInWithCredentials(
      SignInWithCredentialsPressed event, Emitter<SignInFormState> emit) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
      );
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      ));
    } else {
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        showErrorMessages: true,
      ));
    }
  }

  void _onSignInWithGoogle(
      SignInWithGooglePressed event, Emitter<SignInFormState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));
    final failureOrSuccess = await _authFacade.signInWithGoogle();
    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: some(failureOrSuccess),
    ));
  }
}
