import 'package:flutter/material.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/themes/colors.dart';
import 'package:upds_info/widgets/appbar_widget.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageTwo extends StatelessWidget {
  final List<String> images;
  final String nombre;
  const PageTwo({super.key, required this.images, required this.nombre});

  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final sizeTexto = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: nombre),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 250,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                String pageTitle = (index >= images.length - 2)
                    ? 'REQUISITOS'
                    : 'MALLA CURRICULAR';

                String pageTitle2 = (index >= images.length - 5)
                    ? 'RESOLUCIÓN'
                    : 'MALLA CURRICULAR';
                ////Resolucion ministerial
                return Column(
                  children: [
                    Text(
                      nombre != 'INGENIERÍA INDUSTRIAL'
                          ? pageTitle
                          : pageTitle2,
                      style: TextStyle(
                        fontSize: sizeTexto,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Akshar',
                        color: updsAzul,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 280,
                      child: InteractiveViewer(
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
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
