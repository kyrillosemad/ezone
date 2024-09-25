import 'package:ezone/controller/items/items_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:ezone/view/view_modules/home_page/widgets/custom_appbar.dart';
import 'package:ezone/view/view_modules/items/widgets/custom_list_categories_in_items.dart';
import 'package:ezone/view/view_modules/items/widgets/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsCont controller = Get.put(ItemsCont());
    controller.getItemsData(controller.selectedCat + 1);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            CustomAppBar(
              titleAppBar: "Find Product",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const SizedBox(height: 10),
            ListCategoriesItems(controller: controller),
            Expanded(
              child: Obx(() {
                return HandlingDataView(
                    reqStatus: controller.reqStatus.value,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.60,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        ItemsModel itemsModel =
                            ItemsModel.fromJson(controller.items[index]);
                        return CustomListItems(
                          itemsModel: itemsModel,
                          controller: controller,
                        );
                      },
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
