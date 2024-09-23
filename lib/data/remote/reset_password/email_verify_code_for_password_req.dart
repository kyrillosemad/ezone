import 'package:ezone/core/classes/crud.dart';

emailVerifyCodeForPasswordReq(link, data) {
  var res = Crud().crud(link, data);
  return res;
}
