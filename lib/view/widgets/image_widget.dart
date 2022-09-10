import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../web_providers/api_endpoints.dart';
import '../../res/colors/colors.dart';
import '../../res/dimens/dimens.dart';

Widget imageWidget(String image, {BoxFit fit = BoxFit.cover,double? radius,}) {
  return CachedNetworkImage(
    fit: fit,
    fadeInCurve: Curves.easeInCubic,
    filterQuality: FilterQuality.medium,
    fadeInDuration: const Duration(seconds: 1),
    placeholderFadeInDuration: const Duration(seconds: 1),
    fadeOutDuration: const Duration(seconds: 1),
    imageUrl: imageUrlChecker(image),
    placeholder: (context, url) =>Container(color: AppColors.cardColor,child: const CupertinoActivityIndicator()),
    errorWidget: (context, url, error) => Container(color: AppColors.cardColor,child: Icon(Icons.error_outline)),
  );
}

String imageUrlChecker(String url) {
  if (url.startsWith("https")) {
    return url;
  } else {
    return APIEndpoint.mediaURL + url;
  }
}
