// ignore_for_file: must_be_immutable

part of 'registration_bloc.dart';

/// Represents the state of Registration in the application.
class RegistrationState extends Equatable {
  RegistrationState({
    this.emailController,
    this.inputfieldoneController,
    this.inputfieldController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.wantNewsInfo = false,
    this.registrationModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? inputfieldoneController;

  TextEditingController? inputfieldController;

  RegistrationModel? registrationModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  bool wantNewsInfo;

  @override
  List<Object?> get props => [
        emailController,
        inputfieldoneController,
        inputfieldController,
        isShowPassword,
        isShowPassword1,
        wantNewsInfo,
        registrationModelObj,
      ];
  RegistrationState copyWith({
    TextEditingController? emailController,
    TextEditingController? inputfieldoneController,
    TextEditingController? inputfieldController,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? wantNewsInfo,
    RegistrationModel? registrationModelObj,
  }) {
    return RegistrationState(
      emailController: emailController ?? this.emailController,
      inputfieldoneController:
          inputfieldoneController ?? this.inputfieldoneController,
      inputfieldController: inputfieldController ?? this.inputfieldController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      wantNewsInfo: wantNewsInfo ?? this.wantNewsInfo,
      registrationModelObj: registrationModelObj ?? this.registrationModelObj,
    );
  }
}
