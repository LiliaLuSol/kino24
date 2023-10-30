import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/other/app_export.dart';
import 'package:kino24/pages/profile_user/models/profile_user_model.dart';
part 'profile_user_event.dart';
part 'profile_user_state.dart';

/// A bloc that manages the state of a ProfileUser according to the event that is dispatched to it.
class ProfileUserBloc extends Bloc<ProfileUserEvent, ProfileUserState> {
  ProfileUserBloc(ProfileUserState initialState) : super(initialState) {
    on<ProfileUserInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileUserInitialEvent event,
    Emitter<ProfileUserState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      phoneoneController: TextEditingController(),
      birthdayoneController: TextEditingController(),
      nicknameoneController: TextEditingController(),
      genderoneController: TextEditingController(),
    ));
  }
}
