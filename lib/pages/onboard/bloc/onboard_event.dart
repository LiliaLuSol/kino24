part of 'onboard_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Onboard widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardEvent extends Equatable {}

/// Event that is dispatched when the Onboard widget is first created.
class OnboardInitialEvent extends OnboardEvent {
  @override
  List<Object?> get props => [];
}
