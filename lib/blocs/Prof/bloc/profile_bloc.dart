import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/blocs/Prof/models/profile_model.dart';
import '/other/app_export.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
  }

  _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      phoneoneController: TextEditingController(),
      birthdayoneController: TextEditingController(),
      nicknameoneController: TextEditingController(),
      genderoneController: TextEditingController(),
    ));
  }

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(isSelectedSwitch: event.value));
  }
}
