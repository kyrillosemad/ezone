import 'package:ezone/core/classes/crud.dart';

resetPasswordReq(link, data) {
  var res = Crud().crud(link, data);
  return res;
}
