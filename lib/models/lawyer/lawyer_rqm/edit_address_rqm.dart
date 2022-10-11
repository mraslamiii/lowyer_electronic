class EditAddressRQM {
  String? cityName;
  String? addressOffice;
  String? tellOffice;
  String? lat;
  String? long;
  String? licenseNumber;
  String? licenseCreateDate;
  String? method;
  String? licenseExpiredDate;

  EditAddressRQM({
    this.cityName,
    this.addressOffice,
    this.tellOffice,
    this.lat,
    this.method,
    this.long,
    this.licenseNumber,
    this.licenseCreateDate,
    this.licenseExpiredDate,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_name'] = cityName;
    data['address_office'] = addressOffice;
    data['Tell_office'] = tellOffice;
    data['lat'] = lat;
    data['long'] =long;
    data['license_number'] = licenseNumber;
    data['_method'] = method;
    data['license_create_date'] = licenseCreateDate;
    data['license_expire_date'] = licenseExpiredDate;
    return data;
  }
}
