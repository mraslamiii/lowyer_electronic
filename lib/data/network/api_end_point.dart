

import '../../app/config.dart';

class APIEndpoint {
  static const String urlGeneralAPI =
      "https://${ConfigConstants.domain}/api";

  static const String _generalURL = "https://api.supermive.com";
  static const String apiBaseURL = "$_generalURL/api/";
  static const String mediaURL = _generalURL;
  static const String uploadURL = "$_generalURL/api/";

//****************************Defaults ****************************//
  static const String insert = "";
  static const String getByID = "getByID";
  static const String search = "search";
  static const String profile = "profile";
  static const String file = "folder=app";

  // https://api.keenflous.nl/api/v1/personal/profile
//****************************Custom ****************************//
  static const String getByCategoryType = "client-view-by-categorytype";
  static const String client = "client";
  static const String anonymousClient = "anonymous-client";
  static const String sendCode = "sendcode?phoneNumber=";
  static const String commentsByProductId = "commentsbyproductidasync";
  static const String orders = "orders";
  static const String validationConfirmationCode = "tokenbycode";
  static const String getAllProducts = "search-by-sp";
  static const String addresses = "addresses";
  static const String bookmark = "bookmark";
  static const String address = "address";
  static const String basket = "basket";
  static const String register = "register-with-codeconfirmation";
  static const String forgotPassword = "forgot-password-bycode";
  static const String resetPassword = "reset-password-bycode";
  static const String validateEmail = "emailexists";
  static const String home = "by-page?page=h";
  static const String byCategoryID = "by-categoryid";

  // static const String home = "by-page?page=h";
  static const String pageView = "page-view";
  static const String byProductID = "byproductid";
  static const String offerte = "offerte";
  static const String followUp = "followup";
  static const String searchBySp = "search-by-sp";
  static const String coupons = "applycoupononbasket";
  static const String anonymousRepairRequest = "anonymous-client";
  static const String numberRepairStatus = "numberofrepairrequestsinstatus";

  static String urlCreator(APIControllers controller, String endPoint,
      {String version = "v1", String? id}) {
    String url;
    if (version.isNotEmpty) {
      url = "$version/${controller.name}";
    } else {
      url = controller.name;
    }

    if (endPoint.isNotEmpty) {
      url = "$url/$endPoint";
    }

    if (id != null) {
      url = "$url/$id";
    }

    return url;
  }
}

enum APIControllers {
  addresses,
  adsItem,
  adsZones,
  auditLogs,
  baskets,
  blogCategories,
  blogPosts,
  blogTags,
  bookmarks,
  brands,
  categories,
  cms,
  colors,
  comments,
  coupons,
  couponsUses,
  faqs,
  fileManager,
  fileUploader,
  login,
  likes,
  localizations,
  mailTemplates,
  orders,
  payments,
  personal,
  popularProducts,
  problems,
  productProblems,
  products,
  productSections,
  productSpecifications,
  repairRequestArchives,
  repairRequests,
  roleClaims,
  roles,
  stats,
  tags,
  tenants,
  testimonials,
  tickets,
  tokens,
  users,
  warranties,
  contactusmessages
}
