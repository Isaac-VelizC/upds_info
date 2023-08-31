import 'package:flutter/material.dart';
import 'package:upds_info/datas/carreras.dart';
import 'package:upds_info/models/carrera.dart';
import 'package:upds_info/pages/page_home.dart';
import 'package:upds_info/pages/page_one.dart';
import 'package:upds_info/themes/colors.dart';
import 'package:upds_info/widgets/navegation_widget.dart';

class PageCarrera extends StatefulWidget {
  final String tipo;
  const PageCarrera({super.key, required this.tipo});

  @override
  State<PageCarrera> createState() => _PageCarreraState();
}

class _PageCarreraState extends State<PageCarrera> {
  final int _selectedIndex = 0;

  List<Carrera> getCarrerasPorTipo(String tipo) {
    return carreras.where((carrera) => carrera.tipo == tipo).toList();
  }

  @override
  Widget build(BuildContext context) {
    final carrerasFiltradas = getCarrerasPorTipo(widget.tipo);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.tipo == 'PRE'
                  ? 'assets/BakcGround.png'
                  : 'assets/BakcGroundSemi.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount:
                carrerasFiltradas.length + (widget.tipo == 'SEMI' ? 0 : 1),
            itemBuilder: (context, index) {
              if (index == carrerasFiltradas.length - 1 &&
                  widget.tipo != 'SEMI') {
                return const ListTile(
                  title: Center(
                    child: Text(
                      'Nueva Carrera',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: negro,
                        fontFamily: 'Akshar',
                      ),
                    ),
                  ),
                );
              } else if (index == carrerasFiltradas.length) {
                // Último elemento: Elemento normal
                final carrera =
                    carrerasFiltradas[index - (widget.tipo != 'SEMI' ? 1 : 0)];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          carrera.nombre,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: blanco,
                            fontFamily: 'Akshar',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageOne(
                          carrera: carrera,
                        ),
                      ),
                    );
                  },
                );
              } else {
                final carrera = carrerasFiltradas[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          carrera.nombre,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: blanco,
                            fontFamily: 'Akshar',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageOne(
                          carrera: carrera,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.tipo == 'PRE'
                  ? 'assets/BakcGround.png'
                  : 'assets/BakcGroundSemi.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: NavigationWidget(
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
      ),
    );
  }
}
