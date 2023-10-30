import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/registration/models/registration_model.dart';
part 'registration_event.dart';
part 'registration_state.dart';

/// A bloc that manages the state of a Registration according to the event that is dispatched to it.
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(RegistrationState initialState) : super(initialState) {
    on<RegistrationInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(wantNewsInfo: event.value));
  }

  _onInitialize(
    RegistrationInitialEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        inputfieldoneController: TextEditingController(),
        inputfieldController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
        wantNewsInfo: false));
  }
}
