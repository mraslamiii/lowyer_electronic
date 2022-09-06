import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:kanoon_dadgostari/view/base/scan_search_page/binding/scan_search_binding.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/text_form_field/text_form_field_widget.dart';
import '../controller/scan_search_controller.dart';

class ScanSearchPage extends GetView<ScanSearchController> {
  ScanSearchPage({
    // required this.controller,
    Key? key}) : super(key: key);

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
            appBar: AppBar(
              title: const Text(
                "جستجو از طریق QR",
              ),
              leading: backIcon(),
            ),
            body: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1/1,
                      child: _buildQrView(context)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        start: standardSize,
                        end: standardSize,
                        top: xLargeSize,
                      ),
                      child: TextFormFieldWidget(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textDirection: TextDirection.ltr,
                        label: "کد پـذیرنده",
                        maxLength: 10,
                        //
                        onChange: controller.valueChanged,
                        hint: "کد پـذیرنده را وارد گنید...",
                        textEditingController:
                        controller.codeTxtController,
                      ),
                    ),
                  ),
                ],
              ), context: context,
          );
        }
    );
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
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? fullHeight/2
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Container(
      height: fullHeight/3,
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
  }}

// class ScanSearchPageState extends State<ScanSearchPage> {
//   QRViewController? qrViewController;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//
//   void _onQRViewCreated(QRViewController controller) {
//     qrViewController = controller;
//     controller.scannedDataStream.listen((scanData) {
//       Barcode a = scanData;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ScanSearchController>(
//       init: ScanSearchController(),
//       builder: (controller) => customScaffold(
//         appBar: AppBar(
//           title: const Text(
//             "جستجو از طریق QR",
//           ),
//           leading: backIcon(),
//         ),
//         context: context,
//         body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Expanded(
//             flex: 4,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text(
//                   'Barcode Type: ''   Data: ${result!.code}')
//                   : Text('Scan a code'),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(
//                 top: standardSize, left: standardSize, right: standardSize),
//             child: Text(
//               "دسته بندی",
//               style: Get.theme.textTheme.headline6
//                   ?.copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
