import 'package:ezone/controller/favorite/favorite_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/favorite/favorite_model.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:ezone/view/shared_widgets/custom_app_bar.dart';
import 'package:ezone/view/view_modules/home_page/widgets/favorite_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteCont controller = Get.put(FavoriteCont(), permanent: false);
    return Scaffold(
      appBar: const CustomAppBar2(title: "Favorite"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Obx(() {
              return HandlingDataView(
                reqStatus: controller.reqStatus.value,
                widget: controller.favorite.isEmpty
                    ? Center(
                        child: Center(
                          child: Lottie.asset("assets/lottie/noData.json",
                              height: 170),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: controller.favorite.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return CustomListFavoriteItems(
                            index: index,
                            favoriteCont: controller,
                            favoriteModel: FavoriteModel.fromJson(
                                controller.favorite[index]),
                            itemsModel:
                                ItemsModel.fromJson(controller.favorite[index]),
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
