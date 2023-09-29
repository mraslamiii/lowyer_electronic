import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/controller/lawyer_license_info_controller.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/page/lawyer_license_info_page.dart';
import 'package:kanoon_dadgostari/view/widgets/back_widget/back_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'app/app_pages.dart';

class MapPage extends StatefulWidget {
  MapController? controller;

  MapPage({this.controller});

  @override
  State<StatefulWidget> createState() => _LocationAppExampleState();
}

class _LocationAppExampleState extends State<MapPage> {
  /// Variables ///
  final theme = Get.theme;
  late PickerMapController controller;

  /// Instances ///
  LawyerLicenseInfoController lawyerLicenseInfoController = Get.find();

  /// Futures ///
  Future<bool> onBackClicked() {
    Get.off(LawyerLicenseInfoPage());
    return Future.value(false);
  }
  @override
  void initState() {
    var a = lawyerLicenseInfoController.pref.lawyer.profile;
    debugPrint('${a!.lat} lattt');
    a.lat.isEmpty  ? '0':
    lawyerLicenseInfoController.geoPoint =
        lawyerLicenseInfoController.geoPoint ??
            GeoPoint(
                latitude: double.parse(
                    a.lat),
                longitude: double.parse(
                    a.long));

    controller = PickerMapController(
      initPosition: lawyerLicenseInfoController.geoPoint,
      initMapWithUserPosition: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${lawyerLicenseInfoController.pref.lawyer.profile!.lat} lattt');
    debugPrint('${lawyerLicenseInfoController.geoPoint} ge');
    return WillPopScope(
      onWillPop: onBackClicked,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_searching),
          onPressed: () async {
            // =    PickerMapController(
            //   initPosition: lawyerLicenseInfoController.geoPoint,
            //   initMapWithUserPosition: true,
            // );
            GeoPoint geoPoint = await controller.osmBaseController.myLocation();
            debugPrint('${geoPoint} asda');
            debugPrint('${controller.osmBaseController.myLocation()} asda');
            controller.goToLocation(geoPoint);

            await controller.osmBaseController.changeLocation(geoPoint);
            await controller.osmBaseController.setZoom(stepZoom: 3);
          },
        ),
        body: CustomPickerLocation(
          controller: controller,
          appBarPicker: AppBar(
            leading: backIcon(
              onTap: () {
                Get.off(LawyerLicenseInfoPage());
              },
            ),
          ),
          bottomWidgetPicker: Positioned(
            bottom: standardSize,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: standardSize,
                  ),
                  child: progressButton(
                      onTap: () async {
                        // var setMap =
                        //     lawyerLicenseInfoController.pref.lawyer.profile;
                        // controller.getCurrentPositionAdvancedPositionPicker();
                        // controller.osmBaseController
                        //     .getCurrentPositionAdvancedPositionPicker();
                        // controller.selectAdvancedPositionPicker();
                        // controller.osmBaseController.currentLocation();
                        // controller.osmBaseController.enableTracking();
                        GeoPoint a = await controller
                            .getCurrentPositionAdvancedPositionPicker();
                        lawyerLicenseInfoController.lat = a.latitude;
                        lawyerLicenseInfoController.long = a.longitude;
                        lawyerLicenseInfoController.geoPoint = a;
                        lawyerLicenseInfoController.changeLoctaion(a);
                        Get.offNamed(Routes.lawyerLicenseInfoPage);
                        lawyerLicenseInfoController.update();
                      },
                      // async {
                      //   var a = await controller
                      //       .getCurrentPositionAdvancedPositionPicker();
                      //   Get.back(result: a);
                      // },
                      text: "انتخاب موقیعت مکانی"),
                ),
              ],
            ),
          ),
          pickerConfig: CustomPickerLocationConfig(
            initZoom: 16,
            minZoomLevel: 6,
            maxZoomLevel: 18,
            stepZoom: 1.0,
            loadingWidget: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(),
                SizedBox(
                  height: smallSize,
                ),
                Text(
                  "Receiving information",
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            advancedMarkerPicker: MarkerIcon(
              iconWidget: Icon(
                Icons.location_on,
                color: Colors.red,
                size: iconSizeLarge * 4,
              ),
              // icon:Icon(Icons.access_alarm) ,
              // assetMarker: AssetMarker(scaleAssetImage: 12,
              // image: AssetImage('assets/avatar.JPG')),
              // SvgPicture.asset("assets/ic_location_bold.svg",
              //     width: fullWidth/4, height: fullWidth/4),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomMap extends StatefulWidget {
  MyCustomMap({super.key});

  @override
  State<StatefulWidget> createState() => _MyCustm();
}

class _MyCustm extends State<MyCustomMap> {
  final LawyerLicenseInfoController controller =
      Get.put(LawyerLicenseInfoController());
  late MapController mapController;

  @override
  void initState() {
    mapController = MapController(
        initPosition: GeoPoint(longitude: 36, latitude: 36),
        initMapWithUserPosition: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: mapController,
      isPicker: false,
      initZoom: 16,
      minZoomLevel: 8,
      stepZoom: 3.0,
      userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.blue,
              size: 120,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.blue,
              size: 120,
            ),
          )),
      markerOption: MarkerOption(
          defaultMarker: const MarkerIcon(
        icon: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 120,
        ),
      )),
    );
  }
}
