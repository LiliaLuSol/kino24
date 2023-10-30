part of 'screensaver_bloc.dart';

//состояние Screensaver
class ScreensaverState extends Equatable {
  ScreensaverState({this.screensaverModelObj});

  ScreensaverModel? screensaverModelObj;

  @override
  List<Object?> get props => [
        screensaverModelObj,
      ];
  ScreensaverState copyWith({ScreensaverModel? screensaverModelObj}) {
    return ScreensaverState(
      screensaverModelObj: screensaverModelObj ?? this.screensaverModelObj,
    );
  }
}
