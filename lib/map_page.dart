import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/controller/lawyer_license_info_controller.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/page/lawyer_license_info_page.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

class MapPage extends StatelessWidget {
  // MapController? controller;
  // MapPage({this.controller});

  // @override
  // State<StatefulWidget> createState() => _LocationAppExampleState();
// }

// class _LocationAppExampleState extends State<MapPage> {
  final theme = Get.theme;
  final LocalStorageService pref = Get.find();
  LawyerLicenseInfoController controller = Get.put(LawyerLicenseInfoController());

  // @override
  // void initState() {
  //   controller = PickerMapController(
  //     initMapWithUserPosition: true,
  //
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CustomPickerLocation(
      controller: controller.pickerController,
      bottomWidgetPicker: Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: standardSize),
              child: progressButton(
                  onTap: () async {
                    GeoPoint a = await controller.pickerController
                        .getCurrentPositionAdvancedPositionPicker();
                    debugPrint('${a.latitude} lattttAAAA');

                    controller.lat = a.latitude;
                    controller.long= a.longitude;
                    controller.geoPoint = a;
                    debugPrint('${controller.lat} latttt');
                    debugPrint('${controller.long} longggggggg');
                    // debugPrint('${pref.lawyer.profile?.lat} latttt');
                    Get.offNamed(Routes.lawyerLicenseInfoPage);
                    controller.update();

                  },
                  text: "انتخاب موقیعت مکانی"),
            ),
            FloatingActionButton(
              child: const Icon(Icons.location_searching),
              onPressed: () async {
                GeoPoint geoPoint = await controller
                    .mapController.osmBaseController
                    .myLocation();
                debugPrint('${geoPoint.latitude} FacELord');
                debugPrint('${geoPoint.longitude} FacELordLong');
                await controller.mapController.osmBaseController
                    .changeLocation(geoPoint);
                await controller.mapController.osmBaseController
                    .setZoom(stepZoom: 3);
              },
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
    );
  }
}

/*
class CustomMap extends GetView<LawyerLicenseInfoController> {
  final bool isPick;

  const CustomMap(this.isPick, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LawyerLicenseInfoController(),
        initState: (state) {},
        builder: (LawyerLicenseInfoController controller) => OSMFlutter(
              controller: controller.controller,
              isPicker: isPick,
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
            ));
  }
}
*/
