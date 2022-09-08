import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kanoon_dadgostari/app/dependency.dart';
import 'package:kanoon_dadgostari/res/app_theme.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/service/deep_link_service.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kanoon_dadgostari/view/user/lowyer_card_page/page/lowyer_card_page.dart';
import 'app/app_pages.dart';
import 'data/network/network_api_service.dart';
import 'service/connection_service/connection_status_binding.dart';

void main() async {
  await initServices();
  DependencyCrator.init();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      // OR Locale('ar', 'AE') OR Other RTL locales,

      home: const LawyerCardPage(),
      theme: AppThemes.lightThemeMobile(context),
      initialBinding: ConnectionStatusBinding(),
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: widget!,
        );
      },
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
    );
  }
}

Future initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(LocalStorageService());
  Get.put(DeepLinkService());
  Get.put(APIProvider());

  // Get.putAsync<Isar>(() async => IsarUtil(),
  //     permanent: true);
  //
  // await IsarUtil().initDatabase();
}

void setupChromeSystem() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.backgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
