import 'package:flutter/material.dart';
import 'package:upds_info/models/carrera.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/pages/page_two.dart';
import 'package:upds_info/widgets/appbar_widget.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageOne extends StatelessWidget {
  final Carrera carrera;
  const PageOne({super.key, required this.carrera});
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sizeTexto = MediaQuery.of(context).size.width * 0.03;
    final sizeImage = MediaQuery.of(context).size.width * 0.50;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: carrera.nombre),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    carrera.texto1,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: sizeTexto,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Akshar',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    carrera.texto2!.isEmpty ? '' : carrera.texto2!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: sizeTexto,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Akshar',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: sizeImage,
            child: Image(
              image: AssetImage('assets/' + carrera.image1.toString()),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageTwo(
                    images: carrera.images,
                    nombre: carrera.nombre,
                  ),
                ),
              );
            },
            child: const Text(
              'MALLA CURRICULAR',
              style: TextStyle(
                fontFamily: 'Akshar',
              ),
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
