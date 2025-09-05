import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/presentation/pages/start/index.dart';

class CSplashPage extends StatefulWidget {
  const CSplashPage({super.key});

  @override
  State<CSplashPage> createState() => _CSplashPage();
}

class _CSplashPage extends State<CSplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(CVectors.logo),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2));
    context.go('/list');
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => const CStartPage()
    //   )
    // );
  }
}