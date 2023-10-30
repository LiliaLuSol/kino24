// ignore_for_file: must_be_immutable

part of 'homepage_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Homepage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomepageEvent extends Equatable {}

/// Event that is dispatched when the Homepage widget is first created.
class HomepageInitialEvent extends HomepageEvent {
  @override
  List<Object?> get props => [];
}
