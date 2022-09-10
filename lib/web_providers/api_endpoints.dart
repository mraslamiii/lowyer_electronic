import '../app/config.dart';

class APIEndpoint {
  static const String urlGeneralAPI =
      "${ConfigConstants.domain}/api/";


  static const String _generalURL = "https://lawyerb.gelareco.ir";
  static const String apiBaseURL = "$_generalURL/api/";
  static const String mediaURL = _generalURL;
  static const String uploadURL = "$_generalURL/api/";


//****************************Custom ****************************//
  static const String trainings = "trainings";
  static const String skills = "skills";
  static const String code = "code";



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

enum APIControllers { lawyers, register, login }
