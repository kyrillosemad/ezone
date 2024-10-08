class OffersModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsCount;
  double? itemsPrice;
  int? itemsDiscount;
  int? itemsActive;
  String? itemsImage;
  int? itemsCat;
  String? itemsDate;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;
  double? itemspricedisount;

  OffersModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsActive,
      this.itemsImage,
      this.itemsCat,
      this.itemsDate,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNamaAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite,
      this.itemspricedisount});

  OffersModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsPrice = (json['items_price'] is int)
        ? (json['items_price'] as int).toDouble()
        : json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsCat = json['items_cat'];
    itemsDate = json['items_date'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNamaAr = json['categories_nama_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemspricedisount = (json['itemspricedisount'] is int)
        ? (json['itemspricedisount'] as int).toDouble()
        : json['itemspricedisount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_count'] = itemsCount;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_active'] = itemsActive;
    data['items_image'] = itemsImage;
    data['items_cat'] = itemsCat;
    data['items_date'] = itemsDate;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_nama_ar'] = categoriesNamaAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    data['itemspricedisount'] = itemspricedisount;
    return data;
  }
}
