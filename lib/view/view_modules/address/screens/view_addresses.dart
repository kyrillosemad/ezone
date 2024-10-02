import 'package:ezone/controller/address/address_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/address/address_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressCont controller = Get.put(AddressCont());
    controller.getAllAddresses();
    return Scaffold(
      appBar: const CustomAppBar2(title: "My Addresses"),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            controller.goToAddNewAddress();
          },
          child: const Icon(Icons.add)),
      body: Obx(() {
        return HandlingDataView(
          reqStatus: controller.reqStatus.value,
          widget: Center(
            child: SizedBox(
              width: 95.w,
              child: ListView.builder(
                itemCount: controller.addresses.length,
                itemBuilder: (context, i) {
                  return CardAddress(
                    addressModel:
                        AddressModel.fromJson(controller.addresses[i]),
                    onDelete: () {
                      controller.deleteAddress(
                          context, controller.addresses[i]['address_id'], i);
                    },
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(addressModel.addressName!),
      subtitle:
          Text("${addressModel.addressCity!} / ${addressModel.addressStreet}"),
      trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          )),
    ));
  }
}
