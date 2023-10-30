// ignore_for_file: must_be_immutable

part of 'authorization_bloc.dart';

/// Represents the state of Authorization in the application.
class AuthorizationState extends Equatable {
  AuthorizationState({
    this.emailController,
    this.inputfieldoneController,
    this.isShowPassword = true,
    this.authorizationModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? inputfieldoneController;

  AuthorizationModel? authorizationModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        inputfieldoneController,
        isShowPassword,
        authorizationModelObj,
      ];
  AuthorizationState copyWith({
    TextEditingController? emailController,
    TextEditingController? inputfieldoneController,
    bool? isShowPassword,
    AuthorizationModel? authorizationModelObj,
  }) {
    return AuthorizationState(
      emailController: emailController ?? this.emailController,
      inputfieldoneController:
          inputfieldoneController ?? this.inputfieldoneController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      authorizationModelObj:
          authorizationModelObj ?? this.authorizationModelObj,
    );
  }
}
