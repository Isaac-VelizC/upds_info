import 'package:flutter/material.dart';
import 'package:upds_info/datas/carreras.dart';
import 'package:upds_info/pages/page_one.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: carreras.length,
          itemBuilder: (context, index) {
            final carrera = carreras[index];
            return ListTile(
              title: Text(carrera.nombre),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageOne()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
