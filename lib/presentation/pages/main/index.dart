import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/widgets/layout/appbar/index.dart';
import 'package:market_app/widgets/layout/bottombar/index.dart';

class CMainPage extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const CMainPage({super.key, required this.child, required this.state});

  @override
  State<CMainPage> createState() => _CMainPageState();
}

class _CMainPageState extends State<CMainPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color.fromARGB(255, 7, 51, 87), const Color.fromARGB(255, 8, 8, 8)],
        ),
      ),      
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        // appBar: CAppbar(
        //   hideBack: true,
        //   title: SvgPicture.asset(CVectors.logo, height: 40, width: 40,),
        // ),
        body: widget.child,
        // body: SingleChildScrollView(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //     ],
        //   ),
        // ),
        bottomNavigationBar: CBottomBar(),
      ),
    );
  }
}