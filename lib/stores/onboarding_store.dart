import 'package:mobx/mobx.dart';

///
/// Store with all state surrounding onboarding.
///
class OnboardingStore {
  @observable
  bool onboardingFinished = false;

  @observable
  int onboardingStep = 1;

  @action
  void onBoardingIsFinished() => onboardingFinished = true;

  @action
  void setOnboardingStep(int step) => onboardingStep = step;
}