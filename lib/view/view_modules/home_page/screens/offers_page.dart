import 'package:ezone/controller/offers/offers_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/offers/offers_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/home_page/widgets/offer_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersCont controller = Get.put(OffersCont());
    controller.getOffersData();
    return Scaffold(
      appBar: const CustomAppBar2(title: "Offers"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(child: Obx(() {
              return HandlingDataView(
                reqStatus: controller.reqStatus.value,
                widget: controller.offersData.isEmpty
                    ? Center(
                        child: Center(
                          child: Lottie.asset("assets/lottie/noData.json",
                              height: 170),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: controller.offersData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return CustomListOffersItems(
                            offersModel: OffersModel.fromJson(
                                controller.offersData[index]),
                          );
                        },
                      ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
