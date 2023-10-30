// ignore_for_file: must_be_immutable

part of 'profile_user_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileUser widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileUserEvent extends Equatable {}

/// Event that is dispatched when the ProfileUser widget is first created.
class ProfileUserInitialEvent extends ProfileUserEvent {
  @override
  List<Object?> get props => [];
}
