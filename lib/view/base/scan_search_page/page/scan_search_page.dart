import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/base/scan_search_page/binding/scan_search_binding.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/progress_button/progress_button.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/scan_search_controller.dart';
import 'dart:io';

class ScanSearchPage extends StatefulWidget {
  const ScanSearchPage({Key? key}) : super(key: key);

  @override
  State<ScanSearchPage> createState() => _ScanSearchPageState();
}

class _ScanSearchPageState extends State<ScanSearchPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrViewController;
  final scanController = Get.find<ScanSearchController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      bottomAppBar: BottomAppBar(
          elevation: 0,
          child: Container(
            margin: EdgeInsets.all(standardSize),
            child: SizedBox(
              width: fullWidth,
              child: progressButton(onTap: () {}, text: "تایید"),
            ),
          )),
      appBar: AppBar(
        title: const Text(
          "جستجو از طریق QR",
        ),
        leading: backIcon(),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(standardSize),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(smallRadius),
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: scanController.scanning.value
                        ? _doNothing
                        : onQRViewCreated,
                    cameraFacing: CameraFacing.back,
                    overlay: QrScannerOverlayShape(
                        borderColor: Colors.white,
                        borderRadius: 10,
                        borderLength: 26,
                        borderWidth: 10),
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              start: standardSize,
              end: standardSize,
              top: standardSize,
              bottom: standardSize,
            ),
            child: TextFormFieldWidget(
// inputFormatters: [
//   FilteringTextInputFormatter.digitsOnly
// ],
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textDirection: TextDirection.rtl,
              label: "کد پـذیرنده",
//
              onChange: scanController.valueChanged,
              hint: "کد پـذیرنده را وارد گنید...",
              textEditingController: scanController.codeTxtController,
            ),
          ),
        ],
      ),
      context: context,
    );
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      HapticFeedback.vibrate();
      scanController.setQRUrl(scanData);
    });

  }
  void _doNothing(QRViewController controller) {

    print('stopped');
  }

  @override
  void dispose() {
    super.dispose();
    qrViewController?.dispose();
  }

  _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
