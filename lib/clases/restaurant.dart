import 'geoLocation.dart';

class Restaurant {
  final String nombre;
  final String descripcion;
  final String puntuacion;
  final GeoPoint ubicacion;

  Restaurant(this.nombre,this.ubicacion,{this.descripcion,this.puntuacion});
}