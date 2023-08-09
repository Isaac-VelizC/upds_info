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
    return Scaffold(
      appBar: CustomAppBar(title: carrera.nombre),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  carrera.matricula,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, color: negro),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 200,
                child: Image(
                  image: AssetImage('assets/' + carrera.image1.toString()),
                  fit: BoxFit.contain,
                ),
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
              child: const Text('Matrícula'),
            ),
          ],
        ),
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
