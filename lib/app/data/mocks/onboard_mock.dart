import 'package:taiwanswim_getx_app/app/data/models/onboard_model.dart';

class OnboardMock {
  static final _onboardMockdata = [
    Onboard(
      image: 'assets/images/onboarding1st.png',
      name: 'Learn new skills every day!',
      title: 'We provide the best learning couerses & great mentors for you.',
    ),
    Onboard(
      image: 'assets/images/onboarding2nd.png',
      name: 'Easy enroll in class !',
      title: 'Learn anytime and anywhere easily and conveniently.',
    ),
    Onboard(
      image: 'assets/images/onboarding3rd.png',
      name: 'Get online certificate !',
      title:
          'Complete the full course with full dedication to get certificate.',
    ),
    Onboard(
      image: 'assets/images/onboarding4th.png',
      name: 'Explore new reasources !',
      title:
          'Find best course for your career that will help you to develop your skill.',
    ),
  ];

  static List<Onboard> getOnboardsMock() {
    return _onboardMockdata;
  }
}
