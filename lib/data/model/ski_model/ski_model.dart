class SkiModel {
  int? id;
  String? categoryName;
  List<String>? availableDates;
  String? nameRu;
  String? nameKk;
  String? nameEn;
  String? imageUrl;
  String? code;
  bool? enabled;
  bool? dateRequired;
  bool? skiPassRequired;
  String? description;
  String? workingHours;
  List<Tariffs>? tariffs;
  String? createdDate;
  String? updatedDate;

  SkiModel(
      {this.id,
        this.categoryName,
        this.availableDates,
        this.nameRu,
        this.nameKk,
        this.nameEn,
        this.imageUrl,
        this.code,
        this.enabled,
        this.dateRequired,
        this.skiPassRequired,
        this.description,
        this.workingHours,
        this.tariffs,
        this.createdDate,
        this.updatedDate});

  SkiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    availableDates = json['availableDates'].cast<String>();
    nameRu = json['nameRu'];
    nameKk = json['nameKk'];
    nameEn = json['nameEn'];
    imageUrl = json['imageUrl'];
    code = json['code'];
    enabled = json['enabled'];
    dateRequired = json['dateRequired'];
    skiPassRequired = json['skiPassRequired'];
    description = json['description'];
    workingHours = json['workingHours'];
    if (json['tariffs'] != null) {
      tariffs = <Tariffs>[];
      json['tariffs'].forEach((v) {
        tariffs!.add(Tariffs.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['availableDates'] = availableDates;
    data['nameRu'] = nameRu;
    data['nameKk'] = nameKk;
    data['nameEn'] = nameEn;
    data['imageUrl'] = imageUrl;
    data['code'] = code;
    data['enabled'] = enabled;
    data['dateRequired'] = dateRequired;
    data['skiPassRequired'] = skiPassRequired;
    data['description'] = description;
    data['workingHours'] = workingHours;
    if (tariffs != null) {
      data['tariffs'] = tariffs!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}

class Tariffs {
  int? id;
  String? nameRu;
  String? nameKk;
  String? nameEn;
  String? code;
  bool? enabled;
  int? axessMetaTariffId;
  PriceInfo? priceInfo;
  String? createdDate;
  String? updatedDate;

  Tariffs(
      {this.id,
        this.nameRu,
        this.nameKk,
        this.nameEn,
        this.code,
        this.enabled,
        this.axessMetaTariffId,
        this.priceInfo,
        this.createdDate,
        this.updatedDate});

  Tariffs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRu = json['nameRu'];
    nameKk = json['nameKk'];
    nameEn = json['nameEn'];
    code = json['code'];
    enabled = json['enabled'];
    axessMetaTariffId = json['axessMetaTariffId'];
    priceInfo = json['priceInfo'] != null
        ? PriceInfo.fromJson(json['priceInfo'])
        : null;
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameRu'] = nameRu;
    data['nameKk'] = nameKk;
    data['nameEn'] = nameEn;
    data['code'] = code;
    data['enabled'] = enabled;
    data['axessMetaTariffId'] = axessMetaTariffId;
    if (priceInfo != null) {
      data['priceInfo'] = priceInfo!.toJson();
    }
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}

class PriceInfo {
  bool? enabled;
  double? price;
  String? currency;
  bool? hasPickupBox;
  Null? pickupBoxPrice;
  String? date;

  PriceInfo(
      {this.enabled,
        this.price,
        this.currency,
        this.hasPickupBox,
        this.pickupBoxPrice,
        this.date});

  PriceInfo.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    price = json['price'];
    currency = json['currency'];
    hasPickupBox = json['hasPickupBox'];
    pickupBoxPrice = json['pickupBoxPrice'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enabled'] = enabled;
    data['price'] = price;
    data['currency'] = currency;
    data['hasPickupBox'] = hasPickupBox;
    data['pickupBoxPrice'] = pickupBoxPrice;
    data['date'] = date;
    return data;
  }
}