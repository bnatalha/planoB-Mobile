import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plano_b/app/shared/utils/routes_names_utils.dart';
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

  FocusNode _loginFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool createUserState;

  @override
  void initState() {
    createUserState = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PLANOB',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 64,
                letterSpacing: 1,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: 8),
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
          // height: ,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginFormField,
              _passFormField,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Switch(
                    value: createUserState,
                    onChanged: (bool value) {
                      if (!controller.isLoading.value) {
                        setState(() => createUserState = value);
                      }
                    },
                  ),
                  Text('Create user'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loginFormField {
    return Observer(
      builder: (context) {
        return TextFormField(
          focusNode: _loginFocusNode,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          onEditingComplete: _loginFocusNode.nextFocus,
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
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (String value) => login,
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
      create: createUserState,
    );

    if (result) {
      Modular.to.pushNamed(RouteNamesUtils.HOME_PAGE);
    }
    print("Login $result");
  }
}
