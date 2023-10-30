// ignore_for_file: must_be_immutable

part of 'profile_user_bloc.dart';

/// Represents the state of ProfileUser in the application.
class ProfileUserState extends Equatable {
  ProfileUserState({
    this.emailController,
    this.phoneoneController,
    this.birthdayoneController,
    this.nicknameoneController,
    this.genderoneController,
    this.profileUserModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? phoneoneController;

  TextEditingController? birthdayoneController;

  TextEditingController? nicknameoneController;

  TextEditingController? genderoneController;

  ProfileUserModel? profileUserModelObj;

  @override
  List<Object?> get props => [
        emailController,
        phoneoneController,
        birthdayoneController,
        nicknameoneController,
        genderoneController,
        profileUserModelObj,
      ];
  ProfileUserState copyWith({
    TextEditingController? emailController,
    TextEditingController? phoneoneController,
    TextEditingController? birthdayoneController,
    TextEditingController? nicknameoneController,
    TextEditingController? genderoneController,
    ProfileUserModel? profileUserModelObj,
  }) {
    return ProfileUserState(
      emailController: emailController ?? this.emailController,
      phoneoneController: phoneoneController ?? this.phoneoneController,
      birthdayoneController:
          birthdayoneController ?? this.birthdayoneController,
      nicknameoneController:
          nicknameoneController ?? this.nicknameoneController,
      genderoneController: genderoneController ?? this.genderoneController,
      profileUserModelObj: profileUserModelObj ?? this.profileUserModelObj,
    );
  }
}
