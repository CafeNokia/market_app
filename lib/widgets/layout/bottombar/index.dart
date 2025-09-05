import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/configs/colors/index.dart';

class CBottomBar extends StatefulWidget {
  const CBottomBar({super.key});

  @override
  _CBottomBarState createState() => _CBottomBarState();
}

class _CBottomBarState extends State<CBottomBar> {
  late int _selectedIndex = _getSelectedIndex(context);

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    int index = 0;
    switch (location) {
      case '/list':
        index = 0;
        break;
      case '/indexs':
        index = 1;
        break;
      case '/search':
        index = 2;
        break;
      case '/profile':
        index = 3;
        break;
      default:
        break;
    }
    return index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          context.go('/list');
          break;
        case 1:
          context.go('/indexs');
          break;
        case 2:
          context.go('/search');
          break;
        case 3:
          context.go('/profile');
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.black87,
      backgroundColor: Colors.transparent,
      elevation: 0,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: CColors.primary,
      unselectedItemColor: CColors.lightBackground,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.transparent),
        BottomNavigationBarItem(icon: Icon(Icons.all_inclusive_rounded), label: "Indexs", backgroundColor: Colors.transparent),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search", backgroundColor: Colors.transparent),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile", backgroundColor: Colors.transparent),
      ]
    );
  }
}
