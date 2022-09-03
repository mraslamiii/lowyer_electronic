// import 'package:kanoon_dadgostari/repo/base_repo.dart';
//
// class MovieRepoImp implements BaseRepo{
//   BaseApiService _apiService = NetworkApiService();
//
//   @override
//   Future<MoviesMain?> getDataList() async {
//     try {
//       dynamic response = await _apiService.getResponse(
//           ApiEndPoints().getMovies);
//       print("MARAJ $response");
//       final jsonData = MoviesMain.fromJson(response);
//       return jsonData;
//     } catch (e) {
//       throw e;
//       print("MARAJ-E $e}");
//     }
//   }
// }