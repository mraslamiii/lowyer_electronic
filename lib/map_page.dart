import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/controller/lawyer_license_info_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

import 'app/app_pages.dart';

class MapPage extends StatefulWidget {
  MapController? controller;

  MapPage({this.controller});

  @override
  State<StatefulWidget> createState() => _LocationAppExampleState();
}

class _LocationAppExampleState extends State<MapPage> {
  final theme = Get.theme;
  LawyerLicenseInfoController lawyerLicenseInfoController = Get.find();

  @override
  void initState() {
    lawyerLicenseInfoController.geoPoint ??= GeoPoint(
          latitude: double.parse(
              lawyerLicenseInfoController.pref.lawyer.profile!.lat),
          longitude: double.parse(
              lawyerLicenseInfoController.pref.lawyer.profile!.long));
    controller = PickerMapController(
        initMapWithUserPosition: false,
        initPosition: lawyerLicenseInfoController.geoPoint);
  }

  late PickerMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_searching),
        onPressed: () async {
          GeoPoint geoPoint = await controller.osmBaseController.myLocation();
          debugPrint('${geoPoint.latitude} FacELord');
          debugPrint('${geoPoint.longitude} FacELordLong');
          await controller.osmBaseController.changeLocation(geoPoint);
          await controller.osmBaseController.setZoom(stepZoom: 3);
        },
      ),
      body: CustomPickerLocation(
        controller: controller,
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
                      var setMap = lawyerLicenseInfoController.pref.lawyer.profile;

                      GeoPoint a = await controller
                          .getCurrentPositionAdvancedPositionPicker();
                      lawyerLicenseInfoController.lat = a.latitude;
                      lawyerLicenseInfoController.long = a.longitude;
                      lawyerLicenseInfoController.geoPoint = a;
                      lawyerLicenseInfoController.changeLoctaion(a);
                      // setMap?.lat = a.latitude.toString();
                      // setMap?.lat = a.longitude.toString();

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
    );
  }
}

class CustomMap extends GetView<LawyerLicenseInfoController> {
  final bool isPick;

  const CustomMap(this.isPick, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LawyerLicenseInfoController(),
        initState: (state) {},
        builder: (LawyerLicenseInfoController controller) => OSMFlutter(
              controller: controller.mapController,
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
