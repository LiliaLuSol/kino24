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
    this.isSelectedSwitch = false,
  });

  TextEditingController? emailController;
  TextEditingController? phoneoneController;
  TextEditingController? birthdayoneController;
  TextEditingController? nicknameoneController;
  TextEditingController? genderoneController;
  ProfileModel? profileModelObj;
  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        emailController,
        phoneoneController,
        birthdayoneController,
        nicknameoneController,
        genderoneController,
        profileModelObj,
        isSelectedSwitch,
      ];

  ProfileState copyWith({
    TextEditingController? emailController,
    TextEditingController? phoneoneController,
    TextEditingController? birthdayoneController,
    TextEditingController? nicknameoneController,
    TextEditingController? genderoneController,
    bool? isSelectedSwitch,
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
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
    );
  }
}
