import 'package:ezone/core/classes/request.dart';

signUpReq(String link, Map data) async {
  var res = Request().request(link, data);
  return res; 
}
