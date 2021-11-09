part of 'auth_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = Initial;
  const factory AuthBlocState.authenticated() = Authenticated;
  const factory AuthBlocState.unauthenticated() = Unauthenticated;
}
