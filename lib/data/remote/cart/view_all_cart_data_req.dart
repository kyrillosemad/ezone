import 'package:ezone/core/classes/request.dart';

viewAllCartDataReq(String link, Map data) async {
  var res = Request().request(link, data);
  return res;
}
