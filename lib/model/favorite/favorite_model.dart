class FavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsCount;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsActive;
  String? itemsImage;
  int? itemsCat;
  String? itemsDate;
  int? userId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
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
      this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsCat = json['items_cat'];
    itemsDate = json['items_date'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_usersid'] = favoriteUsersid;
    data['favorite_itemsid'] = favoriteItemsid;
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
    data['user_id'] = userId;
    return data;
  }
}
