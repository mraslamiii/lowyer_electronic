import '../base/safe_convert.dart';

class TitleValueModel {
  String? title = "";
  List<String>? value = [""];

  TitleValueModel({this.title = '', this.value = const []});

  factory TitleValueModel.fromJson(Map<String, dynamic> json) {
    try {
      var _value = TitleValueModel(
        title: asT<String>(json, 'title', defaultValue: ""),
        value: asT<List<String>>(json, 'value',defaultValue: [""]),
      );
      return _value;
    } catch (e) {
      print(e);
      throw "parse bug";
    }
  }

  static List<TitleValueModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => TitleValueModel.fromJson(json)).toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
      };
}
