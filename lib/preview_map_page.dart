import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/service/preferences_service.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/controller/lawyer_license_info_controller.dart';
import 'package:kanoon_dadgostari/view/user/lowyer_card_page/controller/lawyer_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

class PreViewMapPage extends StatefulWidget {
  double lat;
  double long;

  PreViewMapPage({super.key, required this.lat, required this.long});

  @override
  State<StatefulWidget> createState() => _LocationAppExampleState();
}

final LocalStorageService pref = Get.find();

class _LocationAppExampleState extends State<PreViewMapPage> {
  final theme = Get.theme;
  late LawyerLicenseInfoController controller = Get.find();
  late MapController mapController;

  @override
  void initState() {
    mapController =
        MapController(initPosition: GeoPoint(latitude: widget.lat, longitude: widget.long),initMapWithUserPosition: false);

    controller.pickerController = PickerMapController(
        initMapWithUserPosition: false,
        initPosition: GeoPoint(latitude: widget.lat,
            longitude: widget.long)
      // GeoPoint(latitude: controller.lat!,longitude:
      // controller.long!
      // )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,

      onTap: () {
        Get.toNamed(Routes.lawyerLicenseInfoPage);
      },
      child: OSMFlutter(

        controller: mapController,
        trackMyPosition: false,
        initZoom: 16,
        minZoomLevel: 16,
        isPicker: true,
        maxZoomLevel: 16,
        stepZoom: 1.0,
        onMapIsReady: (p0) {
          mapController.addMarker(GeoPoint(latitude: 36, longitude: 54));
        },
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 55,
            ),
          ),
          directionArrowMarker: MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
      ),
    );
//     return CustomPickerLocation(
//       controller: controller.pickerController,
//
// /*
//       bottomWidgetPicker: Positioned(
//         bottom: 0,
//         right: 0,
//         left: 0,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: standardSize),
//               child: progressButton(
//                   onTap: () async {
//                     var a = await controller
//                         .getCurrentPositionAdvancedPositionPicker();
//                     Get.back(result: a);
//                   },
//                   text: "انتخاب موقیعت مکانی"),
//             ),
//
//             FloatingActionButton(
//               child: const Icon(Icons.location_searching),
//               onPressed: () async {
//                 GeoPoint geoPoint = await controller.osmBaseController.myLocation();
//                 debugPrint('${geoPoint.latitude} FacELord');
//                 debugPrint('${geoPoint.longitude} FacELordLong');
//                 await controller.osmBaseController.changeLocation(geoPoint);
//                 await controller.osmBaseController.setZoom(stepZoom: 3);
//
//               },
//             ),
//
//           ],
//         ),
//       ),
// */
//       pickerConfig:
//       CustomPickerLocationConfig(
//         initZoom: 16,
//         minZoomLevel: 6,
//         maxZoomLevel: 18,
//         stepZoom: 1.0,
//         loadingWidget: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const CupertinoActivityIndicator(),
//             SizedBox(
//               height: smallSize,
//             ),
//             Text(
//               "Receiving information",
//               style: theme.textTheme.bodyText1,
//             ),
//           ],
//         ),
//
//         advancedMarkerPicker: MarkerIcon(
//           iconWidget:
//           Icon(Icons.location_on,
//             color: Colors.red,
//             size: iconSizeLarge * 4,
//           ),
//           // icon:Icon(Icons.access_alarm) ,
//           // assetMarker: AssetMarker(scaleAssetImage: 12,
//           // image: AssetImage('assets/avatar.JPG')),
//           // SvgPicture.asset("assets/ic_location_bold.svg",
//           //     width: fullWidth/4, height: fullWidth/4),
//         ),
//       ),
//
//     );
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
