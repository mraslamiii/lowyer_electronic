// import 'package:kanoon_dadgostari/models/base/safe_convert.dart';
//
// import '../../utilites/app_logger.dart';
//
// class BaseResponse<T> {
//   final T data;
//   final String messages;
//   final bool succeeded;
//
//   BaseResponse({
//     required this.data,
//     this.messages = '',
//     this.succeeded = false,
//   });
//
//   factory BaseResponse.fromJson(
//       Map<String, dynamic>? json, Function? fromJsonT) {
//     try {
//       if (json?['data'] is Map<String, dynamic>) {
//         if (fromJsonT != null) {
//           return BaseResponse(
//             data: fromJsonT(json?['data'].cast<Map<String, dynamic>>()),
//
//             messages: asT<String>(json, 'messages'),
//             succeeded: asT<bool>(json, 'succeeded'),
//           );
//         }
//
//         return BaseResponse(
//           data: json?['data'] ?? {},
//           messages: asT<String>(json, 'messages'),
//           succeeded: asT<bool>(json, 'succeeded'),
//         );
//       } else {
//         return BaseResponse(
//           data: asT<T>(json, 'data'),
//           messages: asT<String>(json, 'messages'),
//           succeeded: asT<bool>(json, 'succeeded'),
//         );
//       }
//     } catch (e) {
//       AppLogger.catchParse("$e");
//       // throw (ExceptionConstants.somethingWentWrong);
//     }
//   }
// }
