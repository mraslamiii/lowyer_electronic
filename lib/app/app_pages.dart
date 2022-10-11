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
import 'package:kanoon_dadgostari/view/base/scan_search_page/binding/scan_search_binding.dart';
import 'package:kanoon_dadgostari/view/base/scan_search_page/page/scan_search_page.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_page/page/welfare_center_page.dart';
import 'package:kanoon_dadgostari/view/user/edit_social_info_page/page/edit_social_info_page.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/page/lawyer_license_info_page.dart';
import '../map_page.dart';
import '../view/auth/signup_page/binding/signup_binding.dart';
import '../view/auth/signup_page/page/signup_lawyers_info_page.dart';
import '../view/auth/verification_page/binding/verification_binding.dart';
import '../view/user/edit_profile_page/binding/edit_profile_binding.dart';
import '../view/user/edit_profile_page/page/edit_profile_page.dart';
import '../view/user/edit_social_info_page/binding/edit_social_info_binding.dart';
import '../view/user/lawyer_license_info_page/binding/lawyer_license_info_binding.dart';
import '../view/user/lowyer_card_page/binding/lawyer_binding.dart';
import '../view/user/lowyer_card_page/page/lowyer_card_page.dart';


abstract class Routes {
  static const splashPage = '/splash_page';
  static const loginPage = '/login_page';
  static const editSocialInfoPage = '/edit_social_info_page';
  static const editProfile = '/edit_profile';
  static const homePage = '/home';
  static const lawyerPage = '/lawyer_page';
  static const welfareCenterPage = '/welfare_center_page';
  static const scan_search_page = '/scan_search_page';
  static const lawyerLicenseInfoPage = '/lawyer_license_info_page';
  static const welfareCenterPageDetail = '/welfare_center_page_detail';
  static const signupPage = '/signup_page';
  static const signupPage2 = '/signup_page2';
  static const verificationPage = '/verification_page';
  static const mapPage = '/map_page';
  static const verifyDetails = '/verifyDetails_page';
}

class AppPages {
  static const initialRoute = Routes.splashPage;

  static final routes = [
    GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
    ),

    GetPage(
        name: Routes.splashPage,
        page: () =>  SplashPage(),
        // binding: SplashBinding()
    ),
    GetPage(
      name: Routes.mapPage,
      page: () =>  MapPage( ),
    ),
    GetPage(
      name: Routes.welfareCenterPage,
      page: () =>  WelfareCenterPage(),
    ),

  GetPage(
      name: Routes.lawyerLicenseInfoPage,
      page: () =>  LawyerLicenseInfoPage(),
      binding: LawyerLicenseInfoBinding(),
    ),

    // GetPage(
    //   name: Routes.welfareCenterPageDetail,
    //   page: () =>   WelfareCenterDetailPage(),
    // ),


    GetPage(
        name: Routes.scan_search_page,
        page: () =>  const ScanSearchPage(),
        binding: ScanSearchBinding()
    ),

    GetPage(
        name: Routes.lawyerPage,
        page: () =>  LawyerCardPage(),
        binding: LawyerBinding()
    ),
    // GetPage(
    //     name: Routes.welfareCenterDetail,
    //     page: () => const WelfareCenterDetailPage(),
    //     binding: WelfareCenterDetailBinding()
    // ),

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
        name: Routes.signupPage,
        page: () => SignUpPage(),
        binding: SignUpBinding(),

    ),



    GetPage(
        name: Routes.signupPage2,
        page: () => SignUpLawyerInfoPage(),
        binding: SignUpBinding()
    ),


    GetPage(
      name: Routes.verificationPage,

      page: () => VerificationPage(),
      binding: VerifyBinding()
    ),


    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilePage(),
      binding: EditProfileBinding()
    ),


    GetPage(
      name: Routes.editSocialInfoPage,
      page: () =>  EditSocialInfoPage(),
      binding: EditSocialInfoBinding()
    ),
  ];
}
