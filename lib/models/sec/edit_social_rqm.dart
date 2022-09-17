class EditSocialRQM{
  String? webSite ;
  String? whatsApp;
  String? instagram;
  String? _method;
  EditSocialRQM({
     this.webSite,
     this.instagram,
     this.whatsApp
});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['web_site'] = webSite;
    data['instagram'] = instagram;
    data['whats_app'] = whatsApp;
    data['_method'] = 'patch';

    return data;
  }

}