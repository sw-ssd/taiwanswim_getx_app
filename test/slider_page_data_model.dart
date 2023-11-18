import 'package:learn_manager/models/choose_plane.dart';
import 'package:learn_manager/models/design_list.dart';
import 'package:learn_manager/models/home_slider.dart';
import 'package:learn_manager/models/lesson.dart';
import 'package:learn_manager/models/overviewpage_instructur.dart';
import 'package:learn_manager/models/payment_selection.dart';
import 'package:learn_manager/models/recently_added.dart';
import 'package:learn_manager/models/slider.dart';
import 'package:learn_manager/models/trending_cource.dart';

import 'package:taiwanswim_getx_app/app/modules/onboard/onboard_model.dart';

import '../lib/models/chate_data.dart';
import '../lib/models/chate_messege.dart';
import '../lib/models/completed_cource_model.dart';
import '../lib/models/contect_us_model.dart';
import '../lib/models/faq_model.dart';
import '../lib/models/my_cource.dart';
import '../lib/models/new_user_detail.dart';
import '../lib/models/ongoing_cource_detail.dart';
import '../lib/models/overview_page_grid_model.dart';
import '../lib/models/profile_option.dart';
import '../lib/models/riview_data.dart';

class Utils {
  static List<User> getUser() {
    return [
      User(
          name: "Kevin",
          image: "assets/person.png",
          email: "sdsdsd123@gmail.com",
          phoneNo: '1234567895'),
    ];
  }

  static List<HomeSlider> getHomeSliderPages() {
    return [
      HomeSlider(
          image: 'assets/Group 33971.png', title: 'What you want to learn?'),
      HomeSlider(
          image: 'assets/homeslider2.png', title: 'Get online certificate.'),
      HomeSlider(
          image: 'assets/homeslider2.png', title: 'What you want to learn?'),
    ];
  }

  static List<Design> getDesign() {
    return [
      Design(image: 'assets/d3.png', name: 'Design', color: '0XFFFFF6E5'),
      Design(image: 'assets/d4.png', name: 'Code', color: '0XFFFEE9EB'),
      Design(image: 'assets/d5.png', name: 'Buisness', color: '0XFFECF6FF'),
      Design(image: 'assets/d6.png', name: 'Photography', color: '0XFFFFF6E5'),
    ];
  }

  static List<Trending> getTrending() {
    return [
      Trending(
          review: '4.9',
          image: 'assets/trending1.png',
          title: 'UI/UX Design',
          subtitle: 'master class',
          time: '2 .40 Hrs',
          circleimage: 'assets/trendingcircle1.png',
          personname: 'Jenny Wilson',
          id: 1,
          buttonStatus: false),
      Trending(
          review: '4.9',
          image: 'assets/trending2.png',
          title: 'Office management',
          subtitle: 'master class',
          time: '2 .40 Hrs',
          circleimage: 'assets/trendingcircle2.png',
          personname: 'Cody Fisher',
          id: 2,
          buttonStatus: false),
      Trending(
          review: '3.5',
          image: 'assets/trending3.png',
          title: 'Digital photography',
          subtitle: 'master class',
          time: '12 .30 Hrs',
          circleimage: 'assets/trendingcircle3.png',
          personname: 'Leslie Alexander',
          id: 3,
          buttonStatus: false),
      Trending(
          review: '3.5',
          image: 'assets/trending4.png',
          title: 'Software Development.',
          subtitle: '',
          time: '12 .30 Hrs',
          circleimage: 'assets/trendingcircle4.png',
          personname: 'Kristin Watson',
          id: 4,
          buttonStatus: false),
      Trending(
          review: '4.9',
          image: 'assets/trending5.png',
          title: 'Master in adobe',
          subtitle: 'photoshop',
          time: '2 .40 Hrs',
          circleimage: 'assets/trendingcircle2.png',
          personname: 'Cody Fisher',
          id: 5,
          buttonStatus: false),
      Trending(
          review: '4.9',
          image: 'assets/trending6.png',
          title: 'Flutter Development.',
          subtitle: '',
          time: '12 .30 Hrs',
          circleimage: 'assets/trendingcircle4.png',
          personname: 'Kristin Watson',
          id: 6,
          buttonStatus: false),
    ];
  }

  static List<Recent> getRecentAdded() {
    return [
      Recent(
          image: 'assets/recent1.png',
          time: '2 .40 Hrs',
          review: '4.9',
          personname: 'Jenny Wilson',
          price: '\$174.00',
          circleimage: 'assets/recentcircle1.png',
          title: 'How to make creative photo with photoshop',
          id: 1,
          buttonStatus: false),
      Recent(
          image: 'assets/recent2.png',
          time: '2 .40 Hrs',
          review: '3.9',
          personname: 'Jenny Wilson',
          price: '\$174.00',
          circleimage: 'assets/recentcircle1.png',
          title: 'How to illustratior with diffirent menu and vector',
          id: 2,
          buttonStatus: false),
      Recent(
          image: 'assets/recent1.png',
          time: '2 .40 Hrs',
          review: '4.9',
          personname: 'Jenny Wilson',
          price: '\$140.00',
          circleimage: 'assets/recentcircle1.png',
          title: 'How to make creative photo with photoshop   ',
          id: 3,
          buttonStatus: false),
    ];
  }

  static List<OverViewGrid> getOverView() {
    return [
      OverViewGrid(image: 'assets/gridview1.png', title: '12 Lessons'),
      OverViewGrid(image: 'assets/gridview2.png', title: 'Beginner'),
      OverViewGrid(image: 'assets/gridview3.png', title: '6 Weeks'),
      OverViewGrid(image: 'assets/gridview4.png', title: 'English'),
      OverViewGrid(image: 'assets/gridview5.png', title: 'Certificate'),
      OverViewGrid(image: 'assets/gridview6.png', title: 'Fully Secure'),
    ];
  }

  static List<Instructor> getInstruter() {
    return [
      Instructor(
          image: 'assets/1stinstructor.png',
          title: 'Leslie Alexander',
          subtitle: 'Faculty, Program In UI UX Design'),
      Instructor(
          image: 'assets/2ndinstructor.png',
          title: 'Jacob Jones',
          subtitle: 'Faculty, Program In UI UX Design'),
    ];
  }

  static List<LessonList> getLesson() {
    return [
      LessonList(
          image: 'assets/lesson1.png',
          title: 'Introduction',
          buttonName: 'Lesson 1',
          detail1st: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          detailicon1: 'assets/1stlessondetail.png',
          detail2nd: 'Lorem ipsum dolor sit amet',
          detailicon2: 'assets/2ndlessondetail.png',
          detail3rd: 'Lorem ipsum dolor sit amet',
          detailicon3: 'assets/3rdlessondetail.png',
          detail4th: 'Lorem ipsum dolor sit amet',
          detailicon4: 'assets/4thlessondetail.png',
          detail1stscore: 10,
          detail2ndscore: 9,
          detail3rdscore: 7,
          detail4thscore: 12),
      LessonList(
          image: 'assets/lesson2.png',
          title: 'User Research.',
          buttonName: 'Lesson 2',
          detail1st: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          detailicon1: 'assets/1stlessondetail.png',
          detail2nd: 'Lorem ipsum dolor sit amet',
          detailicon2: 'assets/2ndlessondetail.png',
          detail3rd: 'Lorem ipsum dolor sit amet',
          detailicon3: 'assets/3rdlessondetail.png',
          detail4th: 'Lorem ipsum dolor sit amet',
          detailicon4: 'assets/4thlessondetail.png',
          detail1stscore: 10,
          detail2ndscore: 9,
          detail3rdscore: 7,
          detail4thscore: 12),
      LessonList(
          image: 'assets/lesson3.png',
          title: 'Wireframing',
          buttonName: 'Lesson 3',
          detail1st: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          detailicon1: 'assets/1stlessondetail.png',
          detail2nd: 'Lorem ipsum dolor sit amet',
          detailicon2: 'assets/2ndlessondetail.png',
          detail3rd: 'Lorem ipsum dolor sit amet',
          detailicon3: 'assets/3rdlessondetail.png',
          detail4th: 'Lorem ipsum dolor sit amet',
          detailicon4: 'assets/4thlessondetail.png',
          detail1stscore: 10,
          detail2ndscore: 9,
          detail3rdscore: 7,
          detail4thscore: 12),
      LessonList(
          image: 'assets/lesson5.png',
          title: 'Types of UI design',
          buttonName: 'Lesson 4',
          detail1st: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          detailicon1: 'assets/1stlessondetail.png',
          detail2nd: 'Lorem ipsum dolor sit amet',
          detailicon2: 'assets/2ndlessondetail.png',
          detail3rd: 'Lorem ipsum dolor sit amet',
          detailicon3: 'assets/3rdlessondetail.png',
          detail4th: 'Lorem ipsum dolor sit amet',
          detailicon4: 'assets/4thlessondetail.png',
          detail1stscore: 10,
          detail2ndscore: 9,
          detail3rdscore: 7,
          detail4thscore: 12),
      LessonList(
          image: 'assets/lesson3.png',
          title: 'UI Layout',
          buttonName: 'Lesson 5',
          detail1st: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          detailicon1: 'assets/1stlessondetail.png',
          detail2nd: 'Lorem ipsum dolor sit amet',
          detailicon2: 'assets/2ndlessondetail.png',
          detail3rd: 'Lorem ipsum dolor sit amet',
          detailicon3: 'assets/3rdlessondetail.png',
          detail4th: 'Lorem ipsum dolor sit amet',
          detailicon4: 'assets/4thlessondetail.png',
          detail1stscore: 10,
          detail2ndscore: 9,
          detail3rdscore: 7,
          detail4thscore: 12),
    ];
  }

  static List<ReviewList> getReviewList() {
    return [
      ReviewList(
          image: 'assets/riview1.png',
          discription:
              '“Thank You For Your Services That Save My Time Very Much”.',
          time: '1 day ago'),
      ReviewList(
          image: 'assets/riview2.png',
          discription:
              '“Thank You For Your Services That Save My Time Very Much”.',
          time: '2 day ago'),
      ReviewList(
          image: 'assets/riview3.png',
          discription:
              '“This app is very usefull for all the person in around”.',
          time: '2 day ago'),
      ReviewList(
          image: 'assets/riview4.png',
          discription:
              '“This app is very usefull for all the person in around”.',
          time: '3 day ago'),
      ReviewList(
          image: 'assets/riview1.png',
          discription:
              '“Thank You For Your Services That Save My Time Very Much”.',
          time: '1 day ago'),
      ReviewList(
          image: 'assets/riview2.png',
          discription:
              '“Thank You For Your Services That Save My Time Very Much”.',
          time: '2 day ago'),
      ReviewList(
          image: 'assets/riview3.png',
          discription:
              '“This app is very usefull for all the person in around”.',
          time: '2 day ago'),
      ReviewList(
          image: 'assets/riview4.png',
          discription:
              '“This app is very usefull for all the person in around”.',
          time: '3 day ago'),
    ];
  }

  static List<ChoicePlane> getChoosePlane() {
    return [
      ChoicePlane(
          planeTime: '\$12/Month',
          planfacelity1st: 'Lorem ipsum dolor sit amet',
          planfacelity2nd: 'Lorem ipsum dolor sit amet',
          planfacelity3rd: 'Lorem ipsum dolor sit amet',
          image: 'assets/right.png',
          cho: false,
          id: 1),
      ChoicePlane(
          planeTime: '\$99/Year',
          planfacelity1st: 'Lorem ipsum dolor sit amet',
          planfacelity2nd: 'Lorem ipsum dolor sit amet',
          planfacelity3rd: 'Lorem ipsum dolor sit amet',
          image: 'assets/right.png',
          cho: false,
          id: 2),
    ];
  }

  static List<Payment> getPayment() {
    return [
      Payment(image: 'assets/pay1.png', title: 'Paypal'),
      Payment(image: 'assets/pay2.png', title: 'Master Card'),
      Payment(image: 'assets/pay3.png', title: 'Visa'),
      Payment(image: 'assets/pay4.png', title: 'Cash'),
    ];
  }

  static List<OngoingCources> getOngoingCource() {
    return [
      OngoingCources(
          courceImage: 'assets/ongoingcource1st.png',
          courceName: 'UI UX Design',
          id: 1),
      OngoingCources(
          courceImage: 'assets/ongoingcource2nd.png',
          courceName: 'Flutter Mobile Apps',
          id: 2),
      OngoingCources(
          courceImage: 'assets/ongoingcource3rd.png',
          courceName: 'Python Programming',
          id: 3),
      OngoingCources(
          courceImage: 'assets/ongoingcource4th.png',
          courceName: 'Graphic Designing',
          id: 4)
    ];
  }

  static List<CourceDetails> getCourceDetail() => [
        CourceDetails(
            time: '12 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 01,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '10 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 02,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 03,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '16 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 04,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 05,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '14 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 06,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '12 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 07,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '10 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 08,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 09,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '16 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 10,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 11,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '14 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 12,
            courceID: 1,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '12 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 01,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '10 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 02,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 03,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '16 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 04,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '8 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 05,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
        CourceDetails(
            time: '14 min',
            lessonName: 'Lorem ipsum dolor sit amet consectetur',
            lessonID: 06,
            courceID: 2,
            playIconImage: 'assets/lessonplay.png',
            lockImageImage: 'assets/lock.png',
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
      ];

  static List<Completed> getCompletedCource() {
    return [
      Completed(
          courceName: 'Web Designing',
          courceImage: 'assets/completedcource1st.png'),
      Completed(
          courceName: 'Javascript',
          courceImage: 'assets/completedcource2nd.png'),
    ];
  }

  static List<ProfileOption> getProfileOption() {
    return [
      ProfileOption(
          title: 'My Certifications', icon: 'assets/prorfileoptionicon1st.png'),
      ProfileOption(
          title: 'My Projects', icon: 'assets/prorfileoptionicon2nd.png'),
      ProfileOption(
          title: 'Saved Course', icon: 'assets/prorfileoptionicon3rd.png'),
      ProfileOption(title: 'My Card', icon: 'assets/prorfileoptionicon4th.png'),
      ProfileOption(
          title: 'Help Center', icon: 'assets/prorfileoptionicon5th.png'),
      ProfileOption(
          title: 'Privacy Policy', icon: 'assets/prorfileoptionicon6th.png'),
      ProfileOption(
          title: 'Feedback', icon: 'assets/prorfileoptionicon7th.png'),
      ProfileOption(title: 'Rate Us', icon: 'assets/prorfileoptionicon8th.png'),
    ];
  }

  static List<FAQ> getFaq() {
    return [
      FAQ(
          question: 'What is Learn Management ?',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
      FAQ(
          question: 'How to use Learn Management ?',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
      FAQ(
          question: 'Is Learn Management free to use?',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
      FAQ(
          question: 'Can i create my own course?',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
      FAQ(
          question: 'Lorem ipsum dolor sit amet',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
      FAQ(
          question: 'Lorem ipsum dolor sit amet',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Platea dictumst vestibulum rhoncus est pellentesque elit.'),
    ];
  }

  static List<Contect> getContect() {
    return [
      Contect(
          contectTitle: 'Customer Service',
          contectIcon: 'assets/customer_service_icon.png'),
      Contect(contectTitle: 'Website', contectIcon: 'assets/website_icon.png'),
      Contect(
          contectTitle: 'Whatsapp', contectIcon: 'assets/whatsapp_icon.png'),
      Contect(
          contectTitle: 'Facebook', contectIcon: 'assets/facebook_icon.png'),
      Contect(
          contectTitle: 'Instagram', contectIcon: 'assets/instagram_icon.png'),
    ];
  }

  static List<Chate> getChate() {
    return [
      Chate(
          image: 'assets/chate1.png',
          name: 'Jane Cooper',
          message: 'perfect!',
          time: '11:15',
          messageCount: '2',
          id: 1),
      Chate(
          image: 'assets/chate2.png',
          name: 'Leslie Alexander',
          message: 'How are you?',
          time: '11:15',
          messageCount: '3',
          id: 2),
      Chate(
          image: 'assets/chate3.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '4',
          id: 3),
      Chate(
          image: 'assets/chate4.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '5',
          id: 4),
      Chate(
          image: 'assets/chate5.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '6',
          id: 5),
      Chate(
          image: 'assets/chate1.png',
          name: 'Jane Cooper',
          message: 'perfect!',
          time: '11:15',
          messageCount: '2',
          id: 6),
      Chate(
          image: 'assets/chate2.png',
          name: 'Leslie Alexander',
          message: 'How are you?',
          time: '11:15',
          messageCount: '3',
          id: 7),
      Chate(
          image: 'assets/chate3.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '4',
          id: 8),
      Chate(
          image: 'assets/chate4.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '5',
          id: 9),
      Chate(
          image: 'assets/chate5.png',
          name: 'Jacob Jones',
          message: 'How can i help you?',
          time: '11:15',
          messageCount: '6',
          id: 10),
    ];
  }

  static List<ChateMessage> getChateMessage() {
    return [
      ChateMessage(
          message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
          time: '2.55 PM',
          type: 'receve'),
      ChateMessage(
          message:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          time: '3.10 PM',
          type: 'send'),
      ChateMessage(
          message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
          time: '3.10 PM',
          type: 'receve'),
      ChateMessage(
          message:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          time: '3.12 PM',
          type: 'send'),
    ];
  }
}
