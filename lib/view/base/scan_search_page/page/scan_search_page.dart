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

class ScanSearchPage extends GetView<ScanSearchController> {
  ScanSearchPage(
      {
      // required this.controller,
      Key? key})
      : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    ScanSearchBinding().dependencies();
    return GetBuilder(
        init: controller,
        initState: (state) {
          controller.qrViewController?.resumeCamera();
          controller.update();
          // print();
        },
        builder: (_) {
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
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                AspectRatio(aspectRatio: 1 / 1, child: _buildQrView(context)),
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
                    textDirection: TextDirection.ltr,
                    label: "کد پـذیرنده",
                    //
                    onChange: controller.valueChanged,
                    hint: "کد پـذیرنده را وارد گنید...",
                    textEditingController: controller.codeTxtController,
                  ),
                ),
              ],
            ),
            context: context,
          );
        });
  }

  void _onQRViewCreated(QRViewController qrViewController) {
    controller.qrViewController = qrViewController;
    qrViewController.scannedDataStream.listen((scanData) {
      // setState(() {
      result = scanData;
      // });
    });
  }

  Widget _buildQrView(BuildContext context) {
    return Container(
      height: fullHeight / 3,
      padding: EdgeInsets.all(standardSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallRadius),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(smallRadius),
        child: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              cutOutHeight: fullWidth,
              cutOutWidth: fullWidth,
              borderColor: Colors.white,
              borderRadius: smallRadius,
              borderLength: 0,
              borderWidth: 0),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
