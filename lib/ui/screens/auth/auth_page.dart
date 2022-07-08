import 'package:flutter/material.dart';
import 'package:test/core/resources/colors.dart';
import 'package:test/ui/screens/auth/widgets/auth_content.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          firstGradient,
          lastGradient,
        ],
      )),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Добро пожаловать, Авторизуйтесь',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 69,
                ),
                const AuthContentWidget(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
