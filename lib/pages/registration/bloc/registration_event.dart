// ignore_for_file: must_be_immutable

part of 'registration_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Registration widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RegistrationEvent extends Equatable {}

/// Event that is dispatched when the Registration widget is first created.
class RegistrationInitialEvent extends RegistrationEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends RegistrationEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends RegistrationEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends RegistrationEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
