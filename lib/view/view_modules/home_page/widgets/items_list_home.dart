import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/controller/homepage/home_page_cont.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/items/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ListItemsHome extends GetView<HomePageCont> {
  final HomePageCont homePageCont;
  const ListItemsHome({Key? key, required this.homePageCont}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                homePageCont: homePageCont,
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  final HomePageCont homePageCont;
  const ItemsHome(
      {Key? key, required this.itemsModel, required this.homePageCont})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        homePageCont.goToItemDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
              height: 200,
              width: 150,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  Lottie.asset("assets/lottie/loading.json", height: 100),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 60, color: Colors.red),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 130,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(color: Colors.white, fontSize: 14),
              )),
          Positioned(
              right: 30,
              child: itemsModel.itemsDiscount == 0
                  ? Container()
                  : const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage("assets/images/002-sale-tag.png"),
                    )),
        ],
      ),
    );
  }
}
