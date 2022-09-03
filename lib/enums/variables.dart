
/// In new code, use lowerCamelCase for constant variables, including enum values.

const String dateFormat = "yyyy-MM-dd HH:mm:ss";
const String appName = "یوریکا";



// const String url_general = "https://eurika.ariyanweb.com/app/v1";
const String url_general = "https://eurika.ir/app/v1";
const String url_uploadFile = "/user/profilePhoto";
const String url_pey = "/payment/request/";

//***************************** base *********************************//
//***************************** base *********************************//

const String url_syncApp = "syncapp";

//***************************** Authentication *********************************//
//***************************** Authentication *********************************//

const String url_login = "user/requestCode";
// const String url_verification_code = "user/login/verify";

//***************************** Payment *********************************//
//***************************** Payment *********************************//

// void paymentGateway(int id) async {
//   var url = "https://eurika.ir$url_pey$id";
//
//   try{
//
//     if (await canLaunch(url)) {
//       await launch(url,forceSafariVC: false);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }catch(e){
//     print(e);
//     throw(e);
//   }
//
//
// }

const String url_get_profile = "user/profile/get";


/*
final constantMap = const {
  SnackbarType.blueAndYellow: 'helium',
  SnackbarType.greenAndRed: 'neon',
  18: 'argon',
};

  var a = constantMap[SnackbarType.greenAndRed.index];

*/

const String app_Version = '1.0.0';
