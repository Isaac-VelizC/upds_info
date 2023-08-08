class Carrera {
  int? id;
  late String nombre;
  late String sigla;
  late String matricula;
  late String image1;
  late String? image2;
  late String? image3;

  Carrera({
    this.id,
    required this.nombre,
    required this.sigla,
    required this.matricula,
    required this.image1,
    this.image2,
    this.image3,
  });

  
  Carrera.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    sigla = json['sigla'];
    matricula = json['matricula'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'sigla': sigla,
      'matricula': matricula,
      'image1': image1,
      'image2': image2,
      'image3': image3,
    };
  }
}