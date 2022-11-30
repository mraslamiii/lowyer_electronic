import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/models/category_model/detail_category_model.dart';
import 'package:kanoon_dadgostari/models/entity/basket/service_entity.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/res/dimens/dimens.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import 'package:kanoon_dadgostari/view/widgets/image_widget.dart';
import 'package:kanoon_dadgostari/view/widgets/progress_button/progress_button.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../../../../utilites/hive_utils/hive_utils.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/custom_bottom_sheet.dart';
import '../../basket_controller/basket_controller.dart';
import '../../checkout_page/page/checkout_page.dart';
import '../../../../preview_map_page.dart';

import '../controller/welfare_center_detail_controller.dart';

class WelfareCenterDetailPage extends StatelessWidget {
  WelfareCenterDetailPage({Key? key, this.title, this.id}) : super(key: key);
  final WelfareCenterDetailController controller =
      Get.put(WelfareCenterDetailController());
  String? title;
  String? id;
  final BasketController cartController = Get.put(BasketController());

  // RxBool isAddToCart = false.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterDetailController>(
        init: controller,
        initState: (state) => controller.getDetailCategory(id ?? ''),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  title ?? '',
                ),
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: backIcon(),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      customBottomSheet(
                        context,
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ListView(
                            padding: EdgeInsetsDirectional.only(
                              bottom: fullHeight / 18,
                            ),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              _sheetItem(
                                context: context,
                                title: controller.rpm.profile.website,
                                icon: 'assets/icons/ic_global.svg',
                                isFirst: true,
                              ),
                              _sheetItem(
                                context: context,
                                title: controller.rpm.profile.instagram_page,
                                icon: 'assets/icons/ic_instagram.svg',
                              ),
                              _sheetItem(
                                context: context,
                                title: controller.rpm.profile.tellegram_channel,
                                icon: 'assets/icons/ic_whatsapp.svg',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () => launch(
                          "tel://${controller.rpm.profile.bussines_phone}"),
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black87,
                      ))
                ],
              ),
              body: controller.obx(
                  (state) => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: fullHeight / 4,
                              child: Stack(
                                children: [
                                  _bannerImage(),
                                  _avatarImage(),
                                  GestureDetector(
                                    child: Align(
                                      alignment: Alignment(-0.9, 0.8),
                                      child: progressButton(
                                        isProgress: false,
                                        customStyle: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: smallSize),
                                        ),
                                        text: 'مشاهده محصولات',
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.welfareServicePageDetail);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: largeSize),
                                  child: Text(
                                    "موقعیت مکانی",
                                    textAlign: TextAlign.right,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Get.theme.textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: largeSize,
                                      vertical: standardSize),
                                  child: TextButton(
                                    onPressed: () {
                                      MapsLauncher.launchCoordinates(
                                          controller.rpm.profile.lat,
                                          controller.rpm.profile.long,
                                          'رفتن به این موقعیت مکانی');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.navigation_sharp),
                                        Text(
                                          "مسیریابی",
                                          textAlign: TextAlign.right,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.theme.textTheme.subtitle1
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      Get.theme.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: fullWidth,
                              height: fullHeight / 4,
                              child: PreViewMapPage(
                                lat: controller.rpm.profile.lat,
                                long: controller.rpm.profile.long,
                                // mapController: controller.mapController,
                                // pickerMapController: controller.pickerController,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(standardSize),
                              child: Text(controller.rpm.profile.acceptorAbout),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: smallSize,
                                  horizontal: standardSize),
                              child: Text(
                                "سرویس ها",
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.theme.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.rpm.options.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: standardSize),
                                child: Row(children: [
                                  Icon(
                                    Icons.circle_sharp,
                                    size: smallSize,
                                    color: Get.theme.primaryColor,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: xSmallSize),
                                      child: Text(
                                          controller.rpm.options[index].title))
                                ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: smallSize,
                                  horizontal: standardSize),
                              child: Text(
                                "ویدیو",
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.theme.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: standardSize),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: controller.chewieController != null &&
                                        controller
                                            .chewieController!
                                            .videoPlayerController
                                            .value
                                            .isInitialized
                                    ? Chewie(
                                        controller:
                                            controller.chewieController!)
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // CircularProgressIndicator(),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text('Lading')
                                        ],
                                      ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: standardSize),
                              child: Text(
                                "تصاویر",
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Get.theme.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: standardSize),
                              height: fullHeight / 8,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.rpm.profile.images.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                        width: fullWidth / 4,
                                        height: fullWidth / 8,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: smallSize),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (_) {
                                              return DetailScreen(controller
                                                  .rpm.profile.images[index]);
                                            }));
                                          },
                                          child: Hero(
                                            tag: 'imageHero',
                                            child: imageWidget(controller
                                                .rpm.profile.images[index]),
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        ),
                      ),
                  onLoading: const Center(child: CupertinoActivityIndicator())),
            ));
  }

  Widget _bannerImage() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: SizedBox(
        width: fullWidth,
        height: fullHeight / 5,
        child: imageWidget(controller.rpm.profile.headerPic
            // "https://m3.healio.com/~/media/slack-news/stock-images/fm_im/u/ultraprocessed-foods.jpg",
            ),
      ),
    );
  }

  Widget _avatarImage() {
    return Positioned(
      right: largeSize / 1.2,
      bottom: 0,
      child: SizedBox(
        width: fullHeight / 10,
        height: fullHeight / 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(xSmallRadius),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(xxSmallRadius),
            child: imageWidget(controller.rpm.profile.logo

                // "https://qph.cf2.quoracdn.net/main-qimg-1cf247a96715fe142b6ff10da03e3bb0-pjlq",
                ),
          ),
        ),
      ),
    );
  }

  Widget _descWidget({required String title, required int count}) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.theme.textTheme.bodyText1!.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: xSmallSize),
          Text('$count', style: Get.theme.textTheme.headline6),
        ],
      ),
    );
  }

  Widget _sheetItem({
    required BuildContext context,
    required String title,
    required String icon,
    bool isFirst = false,
    VoidCallback? onTap,
  }) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Ink(
        color: Colors.black54,
        child: InkWell(
          onTap: onTap,
          // splashColor: AppColors.splashColor,
          child: Column(
            children: [
              if (!isFirst)
                Divider(
                  color: AppColors.dividerColor,
                  height: 0.8,
                ),
              Container(
                padding: EdgeInsets.only(
                  top: standardSize,
                  bottom: standardSize,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: smallSize),
                      child: SvgPicture.asset(
                        icon,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Get.theme.textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String image;

  DetailScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      bgColor: Colors.black87,
      context: context,
      appBar: AppBar(
        title: Text("تصویر مرکز رفاهی"),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: InteractiveViewer(
            child: SizedBox.expand(
              child: Image.network(
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
