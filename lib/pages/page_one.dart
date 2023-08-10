import 'package:flutter/material.dart';
import 'package:upds_info/models/carrera.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/pages/page_two.dart';
import 'package:upds_info/themes/colors.dart';
import 'package:upds_info/widgets/appbar_widget.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageOne extends StatelessWidget {
  final Carrera carrera;
  const PageOne({super.key, required this.carrera});
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sizeTexto = MediaQuery.of(context).size.width * 0.03;
    final SizedboxHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      appBar: CustomAppBar(title: carrera.nombre),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: SizedboxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    carrera.texto1,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: sizeTexto,
                        fontWeight: FontWeight.w500,
                        color: negro),
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
                        color: negro),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Image(
              image: AssetImage('assets/' + carrera.image1.toString()),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageTwo(
                    images: carrera.images,
                    nombre: carrera.nombre,
                  ),
                ), // Reemplaza con el nombre de tu nueva página
              );
            },
            child: const Text('MALLA CURRICULAR'),
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
