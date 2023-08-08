import 'package:flutter/material.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
            child: Text('Pagina 4'),
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