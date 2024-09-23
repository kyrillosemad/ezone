import 'package:ezone/core/classes/crud.dart';

loginReq(String link, Map data) async {
  var res = Crud().crud(link, data);
  return res;
}
