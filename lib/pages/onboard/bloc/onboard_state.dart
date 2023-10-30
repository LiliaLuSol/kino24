part of 'onboard_bloc.dart';

class OnboardState extends Equatable {
  OnboardState({this.onboardModelObj});

  OnboardModel? onboardModelObj;

  @override
  List<Object?> get props => [
        onboardModelObj,
      ];
  OnboardState copyWith({OnboardModel? OnboardModelObj}) {
    return OnboardState(
      onboardModelObj: onboardModelObj ?? this.onboardModelObj,
    );
  }
}
