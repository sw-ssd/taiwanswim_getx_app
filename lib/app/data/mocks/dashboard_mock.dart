import 'package:taiwanswim_getx_app/app/data/models/dashboard_model.dart';

class DashboardMock {
  static List<DashSlider> getDashSlider() {
    return [
      DashSlider(
          image: 'assets/images/Group 33971.png',
          title: 'What you want to learn?'),
      DashSlider(
          image: 'assets/images/homeslider2.png',
          title: 'Get online certificate.'),
      DashSlider(
          image: 'assets/images/homeslider2.png',
          title: 'What you want to learn?'),
    ];
  }

  static List<Design> getDesigns() {
    return [
      Design(
          image: 'assets/images/d3.png', name: 'Design', color: '0XFFFFF6E5'),
      Design(image: 'assets/images/d4.png', name: 'Code', color: '0XFFFEE9EB'),
      Design(
          image: 'assets/images/d5.png', name: 'Buisness', color: '0XFFECF6FF'),
      Design(
          image: 'assets/images/d6.png',
          name: 'Photography',
          color: '0XFFFFF6E5'),
    ];
  }
}
