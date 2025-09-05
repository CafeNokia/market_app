import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app/common/helpers/theme/index.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/widgets/layout/appbar/index.dart';

class CHomePage extends StatefulWidget {
  const CHomePage({super.key});

  @override
  State<CHomePage> createState() => _CHomePageState();
}

class _CHomePageState extends State<CHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(
        hideBack: true,
        title: SvgPicture.asset(CVectors.logo, height: 40, width: 40,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: Container(
        height: 188,
        child: SvgPicture.asset(CVectors.homeTopCard),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: CColors.primary,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 40
      ),
      tabs: [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
        Text(
          'Recommands',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),
        ),
      ]
    );
  }
}