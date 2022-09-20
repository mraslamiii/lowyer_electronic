class BanRequestCardRQM {
  String? description;

  BanRequestCardRQM({ this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    return data;
  }
}
