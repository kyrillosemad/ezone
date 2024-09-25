import 'package:ezone/core/classes/request.dart';

loginReq(String link, Map data) async {
  var res = Request().request(link, data);
  return res;
}
