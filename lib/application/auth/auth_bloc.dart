import 'package:bloc/bloc.dart';
import 'package:ddd_architecture_flutter/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final IAuthFacade _authFacade;

  AuthBloc(
    this._authFacade,
  ) : super(Initial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignedOut>(_onSignedOut);
  }

  void _onAuthCheckRequested(
      AuthBlocEvent event, Emitter<AuthBlocState> emit) async {}

  void _onSignedOut(AuthBlocEvent event, Emitter<AuthBlocState> emit) {}
}
