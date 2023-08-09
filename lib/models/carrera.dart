class Carrera {
  int? id;
  late String nombre;
  late String sigla;
  late String matricula;
  late String tipo;
  late String image1;
  late List<String> images; // Array de imágenes

  Carrera({
    this.id,
    required this.nombre,
    required this.sigla,
    required this.matricula,
    required this.tipo,
    required this.image1,
    required this.images,
  });

  Carrera.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    sigla = json['sigla'];
    matricula = json['matricula'];
    tipo = json['tipo'];
    image1 = json['image1'];
    images = json['images'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'sigla': sigla,
      'matricula': matricula,
      'tipo': tipo,
      'image1': image1,
      'images': images,
    };
  }
}
