import 'package:ezone/core/classes/crud.dart';

signUpReq(String link, Map data) async {
  var res = Crud().crud(link, data);
  return res; 
}
