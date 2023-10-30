// ignore_for_file: must_be_immutable

part of 'authorization_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Authorization widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AuthorizationEvent extends Equatable {}

/// Event that is dispatched when the Authorization widget is first created.
class AuthorizationInitialEvent extends AuthorizationEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends AuthorizationEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
