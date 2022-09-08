// import '../../web_models/auth/auth_web_model.dart';
//
// @override
// Future<LoginR> authenticationRequest(String phone) async {
//   try {
//     BaseResponse response = await AuthAPI().authentication(phone);
//     return response.messages.isEmpty ? "" : response.messages.first;
//   } catch (e) {
//     AppLogger.catchLog(e);
//     rethrow;
//   }
// }