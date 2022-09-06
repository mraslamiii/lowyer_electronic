import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/binding/splash_binding.dart';
import 'package:kanoon_dadgostari/view/Intro/splash_page/page/splash_page.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/binding/login_binding.dart';
import 'package:kanoon_dadgostari/view/auth/login_page/page/login_page.dart';
import 'package:kanoon_dadgostari/view/auth/signup_page/page/signup_page.dart';
import 'package:kanoon_dadgostari/view/auth/verification_page/page/verification_page.dart';
import 'package:kanoon_dadgostari/view/auth/verifyDetails_page/page/verify_details_page.dart';
import 'package:kanoon_dadgostari/view/base/home_page/binding/home_binding.dart';
import 'package:kanoon_dadgostari/view/base/home_page/page/home_page.dart';

import '../view/auth/signup_page/binding/signup_binding.dart';
import '../view/auth/verification_page/binding/verification_binding.dart';
import '../view/base/welfare_center_detail_page/binding/welfare_center_detail_binding.dart';
import '../view/base/welfare_center_detail_page/page/welfare_center_detail_page.dart';
import '../view/user/lowyer_card_page/binding/lawyer_binding.dart';
import '../view/user/lowyer_card_page/page/lowyer_card_page.dart';

abstract class Routes {
  static const splashPage = '/splash_page';
  static const loginPage = '/login_page';
  static const homePage = '/home';
  static const lawyerPage = '/lawyer_page';
  static const signupPage = '/signup_page';
  static const verificationPage = '/verification_page';
  static const verifyDetails = '/verifyDetails_page';
  static const welfareCenterDetail = '/welfare_center_detail';
}

class AppPages {
  static const initialRoute = Routes.welfareCenterDetail;

  static final routes = [
    // GetPage(
    //   name: Routes.homePage,
    //   page: () =>  HomePage(),
    // ),
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding()
    ),


    GetPage(
        name: Routes.lawyerPage,
        page: () => const LawyerCardPage(),
        binding: LawyerBinding()
    ),
    GetPage(
        name: Routes.welfareCenterDetail,
        page: () =>  WelfareCenterDetailPage(),
        binding: WelfareCenterDetailBinding()
    ),

    GetPage(
        name: Routes.verifyDetails,
        page: () =>  VerifyDetailsPage(),
        binding: VerifyBinding()
    ),


    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding()
    ),

    GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
        binding: HomeBinding()
    ),


    GetPage(
        name: Routes.signupPage,
        page: () => SignUpPage(),
        binding: SignUpBinding()
    ),


    GetPage(
      name: Routes.verificationPage,
      page: () => VerificationPage(),
      binding: VerifyBinding()
    ),
  ];
}
