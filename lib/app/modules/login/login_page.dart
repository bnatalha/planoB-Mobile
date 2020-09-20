import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loginBox,
            _actionButtonFields,
          ],
        ),
      ),
    );
  }

  Widget get _loginBox {
    Size _size = MediaQuery.of(context).size;
    return Material(
      elevation: 5.0,
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: _size.width * 0.7,
          height: 150,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loginFormField,
            _passFormField,
          ],
        ),
      ),
    );
  }

  Widget get _loginFormField {
    return Observer(
      builder: (context) {
        return TextFormField(
          controller: _loginController,
          decoration: InputDecoration(
            hintText: "Login",
            hintStyle: TextStyle(height: 1.4),
            prefixIcon: Icon(Icons.person),
          ),
          enabled: !controller.isLoading.value,
        );
      },
    );
  }

  Widget get _passFormField {
    return Observer(builder: (context) {
      return TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Senha",
          hintStyle: TextStyle(height: 1.4),
          prefixIcon: Icon(Icons.lock),
          // border: InputBorder.none,
        ),
        enabled: !controller.isLoading.value,
      );
    });
  }

  Widget get _actionButtonFields {
    return Container(
      margin: EdgeInsets.all(12),
      child: Observer(builder: (context) {
        if (!controller.isLoading.value) {
          return RaisedButton(
            elevation: 5.0,
            onPressed: login,
            child: Text("Entrar"),
          );
        } else {
          return Container(
            margin: EdgeInsets.all(14),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> login() async {
    print('Tentando login!');

    final bool result = await controller.login(
      username: _loginController.text,
      password: _passwordController.text,
    );

    if (result) {
      Modular.link.pushNamed('/home');
    }
    print("Login $result");
  }
}
