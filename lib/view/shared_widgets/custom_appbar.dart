import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final IconData icon;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;

  const CustomAppBar(
      {Key? key,
      required this.titleAppBar,
      required this.icon,
      this.onPressedIcon,
      this.onPressedSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedSearch,
                ),
                hintText: titleAppBar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                icon ,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
