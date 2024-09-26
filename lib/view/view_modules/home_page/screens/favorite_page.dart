import 'package:ezone/controller/favorite/favorite_cont.dart';
import 'package:ezone/core/classes/handling_data_view.dart';
import 'package:ezone/model/favorite/favorite_model.dart';
import 'package:ezone/view/shared_widgets/custom_appbar.dart';
import 'package:ezone/view/view_modules/home_page/widgets/favorite_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteCont controller = Get.put(FavoriteCont(), permanent: false);
    controller.getAllFavorite();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            CustomAppBar(
              icon:Icons.favorite,
              titleAppBar: "Your Favorites",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const SizedBox(height: 20),
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
                            favoriteModel: FavoriteModel.fromJson(
                                controller.favorite[index]),
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
