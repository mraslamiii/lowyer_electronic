import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanoon_dadgostari/app/dependency.dart';
import 'package:kanoon_dadgostari/models/entity/basket/service_entity.dart';
import 'package:kanoon_dadgostari/res/app_theme.dart';
import 'package:kanoon_dadgostari/service/deep_link_service.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/utilites/app_logger.dart';
import 'package:kanoon_dadgostari/utilites/hive_utils/hive_utils.dart';
import 'app/app_pages.dart';
import 'web_providers/api_provider.dart';
import 'service/connection_service/connection_status_binding.dart';

void main() async {
  await setupHive();

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
    setupChromeSystem();

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        useInheritedMediaQuery:false,
        builder: (child, contextt) {
          ScreenUtil.init(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.onlyBuilder,

            // defaultTransition: Transition.rightToLeft,
            // localizationsDelegates: const [
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale("en", "US"),
            //   Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
            // ],

            locale: const Locale("fa", "IR"),
            // OR Locale('ar', 'AE') OR Other RTL locales,
            theme: AppThemes.lightThemeMobile(context),
            useInheritedMediaQuery: true,
            // fallbackLocale: LocalizationServices.fallbackLocale,

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
        });
  }
}

Future initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(LocalStorageService());
  Get.put(DeepLinkService());
  Get.put(APIProvider());
  // Get.put(BasketController());

  // Get.putAsync<Isar>(() async => IsarUtil(),
  //     permanent: true);
  //
  // await IsarUtil().initDatabase();
}
setupHive() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(ServiceBasketAdapter());
    // Hive.registerAdapter(BookmarkItemAdapter());
    await Hive.openBox<ServiceBasket>(Boxes.basketBox);
    // await Hive.openBox<BasketItem>(Boxes.nextShoppingBox);
    // await Hive.openBox<BookmarkItem>(Boxes.bookmarkBox);
  } catch (_) {
    AppLogger.catchLog(_);
  }
}
void setupChromeSystem() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
