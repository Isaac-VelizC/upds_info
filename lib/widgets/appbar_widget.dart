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
      flexibleSpace: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Text(
              title,
              style: const TextStyle(
                color: updsAzul,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Akshar',
              ),
            ),
          ),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width - 20,
            color: updsAzul,
          ),
        ],
      ),
    );
  }
}
