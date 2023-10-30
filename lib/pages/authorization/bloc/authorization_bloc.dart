import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/authorization/models/authorization_model.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

/// A bloc that manages the state of a Authorization according to the event that is dispatched to it.
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(AuthorizationState initialState) : super(initialState) {
    on<AuthorizationInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<AuthorizationState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    AuthorizationInitialEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        inputfieldoneController: TextEditingController(),
        isShowPassword: true));
  }
}
