import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _mainCard,
          ],
        ),
      ),
    );
  }

  Widget get _mainCard {
    Size _size = MediaQuery.of(context).size;
    double boxSize = _size.width * 0.8;
    return Center(
      child: Card(
        elevation: 3.0,
        child: Container(
          width: boxSize,
          height: boxSize,
          child: Text("Helou"),
        ),
      ),
    );
  }
}
