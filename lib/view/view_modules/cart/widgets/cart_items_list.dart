import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezone/core/constants/api_links.dart';
import 'package:ezone/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartItemsList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CartItemsList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagesItems}/$image",
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Lottie.asset("assets/lottie/loading.json", height: 100),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 60, color: Colors.red),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style: const TextStyle(fontSize: 15)),
              subtitle: Text(price,
                  style: const TextStyle(
                      color: AppColor.secondColor, fontSize: 17)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                ),
                Text(
                  count,
                  style: const TextStyle(fontFamily: "sans"),
                ),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
