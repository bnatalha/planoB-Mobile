import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plano_b/app/modules/home/components/transaction_details/transaction_details_page.dart';
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
    return TransactionDetailsPage();
  }
}
