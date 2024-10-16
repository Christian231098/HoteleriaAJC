class User {
  int id;
  String correo;
  String nombre;

  User({required this.id,required this.correo,required this.nombre});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User( 
    id: json['id'],
    correo: json['correo'],
    nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
   return{
  'id':id,
   'correo':correo,
   'nombre':nombre,
   };
 
  }
}