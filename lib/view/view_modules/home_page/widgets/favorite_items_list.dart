import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/controller/favorite/favorite_cont.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:ezone/model/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomListFavoriteItems extends GetView<FavoriteCont> {
  final FavoriteModel favoriteModel;
  final int index;

  const CustomListFavoriteItems({
    Key? key,
    required this.favoriteModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "favoriteItem_${favoriteModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}/${favoriteModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Lottie.asset("assets/lottie/loading.json", height: 100),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 60, color: Colors.red),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                favoriteModel.itemsName!,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rating", textAlign: TextAlign.center),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(Icons.star,
                          size: 15, color: Colors.amber);
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${favoriteModel.itemsPrice} \$",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromFavorite(
                          favoriteModel.favoriteId.toString(), index);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
