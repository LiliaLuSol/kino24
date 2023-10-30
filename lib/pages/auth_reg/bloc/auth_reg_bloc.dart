import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/auth_reg/models/auth_reg_model.dart';
part 'auth_reg_event.dart';
part 'auth_reg_state.dart';

/// A bloc that manages the state of a AuthReg according to the event that is dispatched to it.
class AuthRegBloc extends Bloc<AuthRegEvent, AuthRegState> {
  AuthRegBloc(AuthRegState initialState) : super(initialState) {
    on<AuthRegInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AuthRegInitialEvent event,
    Emitter<AuthRegState> emit,
  ) async {}
}
