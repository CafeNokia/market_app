import 'package:flutter/material.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/presentation/pages/main/pages/list/table/index.dart';

class CListPage extends StatelessWidget {
  const CListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const  Center(child: Text("Home Page", style: TextStyle(fontSize: 24, color: CColors.primary)));
    // return CDataTableWidget();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // body: CDataTableWidget(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: kBottomNavigationBarHeight,),
        child: CDataTableWidget()
      ),
    );
  }
}