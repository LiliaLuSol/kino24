// ignore_for_file: must_be_immutable

part of 'auth_reg_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AuthReg widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AuthRegEvent extends Equatable {}

/// Event that is dispatched when the AuthReg widget is first created.
class AuthRegInitialEvent extends AuthRegEvent {
  @override
  List<Object?> get props => [];
}
