class Carrera {
  int? id;
  late String nombre;
  late String sigla;
  late String texto1;
  String? texto2;
  late String tipo;
  late String image1;
  late List<String> images; // Array de imágenes

  Carrera({
    this.id,
    required this.nombre,
    required this.sigla,
    required this.texto1,
    this.texto2,
    required this.tipo,
    required this.image1,
    required this.images,
  });

  Carrera.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    sigla = json['sigla'];
    texto1 = json['texto1'];
    texto2 = json['texto2'];
    tipo = json['tipo'];
    image1 = json['image1'];
    images = json['images'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'sigla': sigla,
      'texto1': texto1,
      'texto2': texto2,
      'tipo': tipo,
      'image1': image1,
      'images': images,
    };
  }
}
