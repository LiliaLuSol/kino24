import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kino24/other/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino24/pages/onboard/models/onboard_model.dart';
part 'onboard_event.dart';
part 'onboard_state.dart';


class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc(OnboardState initialState) : super(initialState) {
    on<OnboardInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardInitialEvent event,
    Emitter<OnboardState> emit,
  ) async {}
}
