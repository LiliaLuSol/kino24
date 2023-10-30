part of 'screensaver_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Screensaver widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ScreensaverEvent extends Equatable {}

/// Event that is dispatched when the Screensaver widget is first created.
class ScreensaverInitialEvent extends ScreensaverEvent {
  @override
  List<Object?> get props => [];
}
