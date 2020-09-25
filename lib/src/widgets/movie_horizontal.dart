import 'package:flutter/material.dart';
import 'package:pelis/src/models/peli_model.dart';

class MovieHorizontal extends StatelessWidget {
  //lista de pelicula importar el modelo
  final List<Peli> peliculas;
//definir en el construcotor
  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    return Container(
      //el 20% de la pantalla
      height: _screensize.height * 0.2,
      //lista de Widgets deslizar paginas
      //coleccion de Widgets paginada
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(), //😠 no se pone dentro de corchetes
      ),
    );
  }

  _tarjetas() {
    return peliculas.map((peli) {
      return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                image: NetworkImage(peli.getPosterImg()),
                placeholder: AssetImage('assets/img/load2.gif'),
                fit: BoxFit.cover,
                //cambiar el tamaño del alto
                height: 100,
              ),
            ),
          ],
        ),
      );
    }).toList(); //lista de witgets para convertirlo
  }
}
