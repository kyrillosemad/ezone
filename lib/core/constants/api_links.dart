class AppLink {
  static const String server = "http://192.168.1.9/ezone";

  static const String imagesStatic = "http://192.168.1.9/ezone/upload";
//========================== Image ============================
  static const String imagesCategories = "$imagesStatic/categories";
  static const String imagesItems = "$imagesStatic/items";
// =============================================================
//
  static const String test = "$server/test.php";

  static const String notification = "$server/notification.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
  // rating

  static const String rating = "$server/rating.php";

//offers
  static const String offers = "$server/offers.php";

// items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon

  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  // Checkout

  static const String checkout = "$server/orders/checkout.php";

  static const String pendingOrders = "$server/orders/pending.php";
  static const String ordersArchive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";
}
