import 'package:flutter/material.dart';
import 'package:pelis/src/widgets/card_widget.dart';
import 'package:pelis/src/providers/peli_provider.dart';
import 'package:pelis/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  final peliculasProv = new PelisProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelis 📹'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_swipeTarget(), _footer(context)],
        ),
      ),
    );
  }

  _swipeTarget() {
    return FutureBuilder(
      future: peliculasProv.getInCinema(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(pelis: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Populares',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
                fontSize: 15),
          ),
          SizedBox(
            height: 5.0,
          ),
          FutureBuilder(
              future: peliculasProv.getInPopular(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data?.forEach((p) => print(p.title)));
                  return MovieHorizontal(peliculas: snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }
}
