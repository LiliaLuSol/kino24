import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino24/other/app_export.dart';
import 'package:kino24/pages/screensaver/models/screensaver_model.dart';
part 'screensaver_event.dart';
part 'screensaver_state.dart';

//управляет Screensaver по ивенту
class ScreensaverBloc extends Bloc<ScreensaverEvent, ScreensaverState> {
  ScreensaverBloc(ScreensaverState initialState) : super(initialState) {
    on<ScreensaverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ScreensaverInitialEvent event,
    Emitter<ScreensaverState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.onboard,
      );
    });
  }
}
