import 'package:flutter/material.dart';
import 'package:upds_info/themes/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: updsAzul, // Cambia al color deseado
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width - 20,
            color: updsCeleste, // Cambia al color deseado
          ),
        ],
      ),
    );
  }
}
