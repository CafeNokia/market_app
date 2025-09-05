import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/presentation/pages/auth/register/index.dart';
import 'package:market_app/presentation/pages/home/index.dart';
import 'package:market_app/widgets/button/index.dart';
import 'package:market_app/widgets/layout/appbar/index.dart';

class CSigninPage extends StatelessWidget {
  const CSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(
        title: SvgPicture.asset(CVectors.logo, width: 40, height: 40,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30
        ),
        child: Column(
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _userameField(context),
            const SizedBox(height: 20,),
            // _emailField(context),
            // const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            CBasicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CHomePage()
                  )
                );
              },
              title: 'Sign In'
            )
          ],
        ),
      ),
      bottomNavigationBar: _signupText(context),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _userameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Username or Email'
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Email'
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password'
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
            )
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CRegisterPage()
                )
              );
            },
            child: const Text('Register')
          )
        ],
      ),
    );
  }
}