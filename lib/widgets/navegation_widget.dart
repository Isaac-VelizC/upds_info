import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationWidget extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const NavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/atras.svg',
            height: 30,
            width: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/inicio.svg',
            height: 30,
            width: 30,
          ),
          label: '',
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.selectedIndex,
      onTap: widget.onIndexChanged,
    );
  }
}
