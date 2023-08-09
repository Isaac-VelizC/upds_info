import 'package:flutter/material.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/widgets/appbar_widget.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageTwo extends StatelessWidget {
  final List<String> images;
  final String nombre;
  const PageTwo({super.key, required this.images, required this.nombre});

  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: nombre),
      body: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Center(
            child: InteractiveViewer(
              child: Image.asset(
                images[index],
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationWidget(
        selectedIndex: _selectedIndex,
        onIndexChanged: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PageHome()),
            );
          }
        },
      ),
    );
  }
}
