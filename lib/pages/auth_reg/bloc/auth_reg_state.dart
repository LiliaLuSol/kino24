// ignore_for_file: must_be_immutable

part of 'auth_reg_bloc.dart';

/// Represents the state of AuthReg in the application.
class AuthRegState extends Equatable {
  AuthRegState({this.authRegModelObj});

  AuthRegModel? authRegModelObj;

  @override
  List<Object?> get props => [
        authRegModelObj,
      ];
  AuthRegState copyWith({AuthRegModel? authRegModelObj}) {
    return AuthRegState(
      authRegModelObj: authRegModelObj ?? this.authRegModelObj,
    );
  }
}
