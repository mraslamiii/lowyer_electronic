import '../app/config.dart';

class APIEndpoint {
  static const String urlGeneralAPI = "${ConfigConstants.domain}/api/";

  static const String _generalURL = "https://lawyerb.gelareco.ir";
  static const String apiBaseURL = "$_generalURL/api/";
  static const String mediaURL = _generalURL;
  static const String uploadURL = "$_generalURL/api/";

//****************************Custom ****************************//
  static const String trainings = "trainings";
  static const String skills = "skills";
  static const String code = "code";
  static const String address = "address";
  static const String uploadImage = "pic/profile";
  static const String logout = "logout";
  static const String banCardRequest = "lawyers/cards/ban";
  static const String makeCardRequest = "lawyers/cards/make";
  static const String getCardListHistory = "lawyers/cards/request";
  static const String category = "category/list";
  static const String social = "social";
  static const String education = "education";

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
  lawyers,
  register,
  login,
  admin,
  acceptor,
  category,
  service,
  logout,
  upload
}
