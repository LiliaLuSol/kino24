// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.emailController,
    this.phoneoneController,
    this.birthdayoneController,
    this.nicknameoneController,
    this.genderoneController,
    this.profileModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? phoneoneController;

  TextEditingController? birthdayoneController;

  TextEditingController? nicknameoneController;

  TextEditingController? genderoneController;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        emailController,
        phoneoneController,
        birthdayoneController,
        nicknameoneController,
        genderoneController,
        profileModelObj,
      ];
  ProfileState copyWith({
    TextEditingController? emailController,
    TextEditingController? phoneoneController,
    TextEditingController? birthdayoneController,
    TextEditingController? nicknameoneController,
    TextEditingController? genderoneController,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      emailController: emailController ?? this.emailController,
      phoneoneController: phoneoneController ?? this.phoneoneController,
      birthdayoneController:
          birthdayoneController ?? this.birthdayoneController,
      nicknameoneController:
          nicknameoneController ?? this.nicknameoneController,
      genderoneController: genderoneController ?? this.genderoneController,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
