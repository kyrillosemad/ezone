import 'package:ezone/core/classes/crud.dart';

checkEmailForPasswordResetReq(link, data) {
  var res = Crud().crud(link, data);
  return res;
}
