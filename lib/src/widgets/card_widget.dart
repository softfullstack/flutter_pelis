import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pelis/src/models/peli_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Peli> pelis;
  CardSwiper({@required this.pelis});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      // width: double.infinity, para todo lo ancho
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.6,
          itemCount: pelis.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    image: NetworkImage(pelis[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/load.gif'),
                    fit: BoxFit.cover,
                  )),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 5.0,
                      offset: Offset(-5, 5)),
                ],
                borderRadius: BorderRadius.circular(30.0),
              ),
            );
          }),
    );
  }
}
