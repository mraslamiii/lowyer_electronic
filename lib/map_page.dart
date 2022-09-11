import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/user/lawyer_license_info_page/controller/lawyer_license_info_controller.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';

import 'res/colors/colors.dart';

class MapPage extends StatefulWidget {
  MapController controller;

  MapPage(this.controller);

  @override
  State<StatefulWidget> createState() => _LocationAppExampleState();
}

class _LocationAppExampleState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: standardSize),
        child: progressButton(
            onTap: () async {
              var a = await widget.controller
                  .getCurrentPositionAdvancedPositionPicker();
              Get.back(result: a);
            },
            text: "انتخاب موقیعت مکانی"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_searching),
        onPressed: () async {
          GeoPoint geoPoint = await widget.controller.myLocation();

          await widget.controller.changeLocation(geoPoint);
          await widget.controller.setZoom(stepZoom: 3);
        },
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(standardRadius),
                right: Radius.circular(standardRadius))),
        margin: EdgeInsets.only(
            bottom: standardSize, right: largeSize, left: largeSize),
        child: const CustomMap(true),
      ),
    );
  }
}

class CustomMap extends GetView<LawyerLicenseInfoController> {
 final bool isPick ;
  const CustomMap (this.isPick, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LawyerLicenseInfoController(),
        initState: (state) {

        },
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
