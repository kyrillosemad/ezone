import 'package:ezone/core/classes/request.dart';

getCartCountReq(String link, Map data) async {
  var res = Request().request(link, data);
  return res;
}
