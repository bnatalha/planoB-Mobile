import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Scaffold.of(context).showBottomSheet((context) => Container(
              height: 250,
              child: Column(
                children: [
                  Text('Nova Transação'),
                  TextField(
                    decoration: InputDecoration(hintText: "Valor"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Categoria"),
                  ),
                  Row(
                    children: [
                      RaisedButton(
                        onPressed: Modular.link.pop,
                        child: Text("Adicionar"),
                      ),
                      RaisedButton(
                        onPressed: Modular.link.pop,
                        child: Text("Cancelar"),
                      ),
                    ],
                  ),
                ],
              ),
            ), backgroundColor: Colors.blueGrey.withOpacity(0.4));
      },
    );
  }
}
