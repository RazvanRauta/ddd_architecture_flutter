part of 'auth_bloc.dart';

@freezed
class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthBlocEvent.signedOut() = SignedOut;
}
