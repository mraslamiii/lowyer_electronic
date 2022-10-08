class UploadImageRQM{
  String? avatar ;
  String? method;
  UploadImageRQM({this.avatar,this.method});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['_method'] = method;
    return data;
  }
}