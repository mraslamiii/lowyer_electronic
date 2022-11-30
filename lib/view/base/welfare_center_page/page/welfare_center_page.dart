import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kanoon_dadgostari/app/app_pages.dart';
import 'package:kanoon_dadgostari/res/colors/colors.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_detail_page/view/welfare_center_detail_page.dart';
import 'package:kanoon_dadgostari/view/base/welfare_center_page/page/welfare_list_page.dart';
import 'package:kanoon_dadgostari/view/widgets/customScaffold/customScaffold.dart';
import '../../../../categories_page.dart';
import '../../../../res/dimens/dimens.dart';
import '../../../../widgets/error_widget.dart';
import '../../../widgets/back_widget/back_widget.dart';
import '../../../widgets/image_widget.dart';
import '../../category_walfare_list_page/category_welfare_list_page.dart';
import '../controller/welfare_center_controller.dart';
import 'category_page.dart';

class WelfareCenterPage extends StatelessWidget {
  WelfareCenterPage({Key? key}) : super(key: key);
  final WelfareCenterController controller = Get.put(WelfareCenterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelfareCenterController>(
        init: controller,
        initState: (state) => controller.getCategory(),
        builder: (controller) => customScaffold(
              appBar: AppBar(
                title: const Text(
                  "مـرکز رفاهـی",
                ),
                leading: backIcon(),
                // actions: [
                //   // IconButton(
                //   //   splashColor: AppColors.splashColor,
                //   //   splashRadius: largeSize / 1.2,
                //   //   onPressed: () async {
                //   //     Get.toNamed(Routes.scan_search_page);
                //   //   },
                //   //   icon: SvgPicture.asset('assets/icons/ic_scan.svg'),
                //   // ),
                // ],
              ),
              context: context,
              body: controller.obx(
                (state) => SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: standardSize,
                            right: standardSize,
                          ),
                          child: Text(
                            "دسته بندی",
                            style: Get.theme.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        TextButton(
                            onPressed: () {
                              Get.to(CategoryPage());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: mediumSize),
                              child: Text(
                                'مشاهده همه',
                                style: Get.textTheme.subtitle1?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Get.theme.primaryColor),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: fullWidth / 1.95,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: mediumSize,
                          bottom: mediumSize,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.rpm.data?.categories.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsetsDirectional.only(
                                end: standardSize,
                                start: index == 0 ? standardSize : 0,
                              ),
                              child: GestureDetector(
                                onTap: () => Get.to(CategoryWelfareListPage(
                                    controller.rpm.data!.categories[index].id,
                                    controller)),
                                child: categoryWidget(
                                  controller
                                          .rpm.data?.categories[index].image ??
                                      '', //todo fix this images
                                  controller
                                          .rpm.data?.categories[index].title ??
                                      '',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: standardSize,
                            right: standardSize,
                          ),
                          child: Text(
                            "مراکز خرید",
                            style: Get.theme.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: EdgeInsets.only(left: mediumSize),
                          child: TextButton(
                              onPressed: () {
                                Get.to(WelfareListPage());
                              },
                              child: Text(
                                'مشاهده همه',
                                style: Get.textTheme.subtitle1?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Get.theme.primaryColor),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      height: fullWidth / 1.7,
                      width: fullWidth,
                      margin: EdgeInsetsDirectional.only(
                        top: mediumSize,
                        bottom: mediumSize,
                      ),
                      child: ListView.builder(
                        itemCount: controller.rpm.data?.acceptors.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsetsDirectional.only(
                              end: standardSize,
                              start: index == 0 ? standardSize : 0,
                            ),
                            child: shoppingCenterWidget(
                              controller,
                              index,
                              controller.rpm.data?.acceptors[index].headerPic ??
                                  '',
                              controller.rpm.data?.acceptors[index]
                                      .bussinesTitle ??
                                  '',
                              '4.8',
                              controller.rpm.data?.acceptors[index]
                                      .acceptorAbout ??
                                  '',
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: standardSize,
                            left: standardSize,
                            right: standardSize,
                          ),
                          child: Text(
                            "مراکز ویـژه",
                            style: Get.theme.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Center(child: Text('هــمـه')),
                      ],
                    ),
                    Container(
                      height: fullWidth / 1.7,
                      width: fullWidth,
                      margin: EdgeInsetsDirectional.only(
                        top: mediumSize,
                        bottom: mediumSize,
                      ),
                      child: ListView.builder(
                        itemCount: controller.rpm.data?.acceptors.length,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsetsDirectional.only(
                              end: standardSize,
                              start: index == 0 ? standardSize : 0,
                            ),
                            child: shoppingCenterWidget(
                              controller,
                              index,
                              controller.rpm.data?.acceptors[index].headerPic ??
                                  '',
                              controller.rpm.data?.acceptors[index]
                                      .bussinesTitle ??
                                  '',
                              '4.8',
                              controller.rpm.data?.acceptors[index]
                                      .acceptorAbout ??
                                  '',
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
                onLoading: const Center(
                  child: CupertinoActivityIndicator(),
                ),
                onError: (error) => errorWidget(
                  isBusy: false.obs,
                  onTap: () {
                    controller.getCategory();
                  },
                ),
              ),
            ));
  }
}

Widget shoppingCenterWidget(
  WelfareCenterController controller,
  int index,
  String picture,
  String shoppingName,
  String rating,
  String subTitle,
) {
  return GestureDetector(
    onTap: () => Get.to(WelfareCenterDetailPage(
      title: controller.rpm.data?.acceptors[index].bussinesTitle ?? '',
      id: controller.rpm.data?.acceptors[index].id.toString() ?? '',
    )),
    child: Container(
      width: fullWidth / 1.35,
      margin: EdgeInsets.only(bottom: smallSize),
      padding: EdgeInsetsDirectional.only(
        start: smallSize,
        end: smallSize,
        top: smallSize,
        bottom: standardSize,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallRadius),
        color: AppColors.formFieldColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: fullWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(smallRadius),
                child: imageWidget(
                  picture,
                  radius: smallRadius,
                ),
              ),
            ),
          ),
          SizedBox(height: xSmallSize),
          Text(
            shoppingName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.theme.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: xxSmallSize),
          Text(
            subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.theme.textTheme.bodyText1?.copyWith(
              color: AppColors.captionColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget categoryWidget(String picture, String title) {
  return Column(
    children: [
      Container(
        width: fullWidth / 3,
        height: fullWidth / 3,
        margin: EdgeInsets.only(bottom: smallSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallRadius),
          color: AppColors.borderColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(smallRadius),
          child: imageWidget(
            picture,
            radius: standardRadius,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Get.theme.textTheme.subtitle1?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}
