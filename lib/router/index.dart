import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/presentation/pages/auth/register/index.dart';
import 'package:market_app/presentation/pages/auth/signup/index.dart';
import 'package:market_app/presentation/pages/choose_mode/index.dart';
import 'package:market_app/presentation/pages/detail/index.dart';
// import 'package:market_app/presentation/pages/home/index.dart';
import 'package:market_app/presentation/pages/login/index.dart';
import 'package:market_app/presentation/pages/main/index.dart';
import 'package:market_app/presentation/pages/main/pages/indexs/index.dart';
import 'package:market_app/presentation/pages/main/pages/list/index.dart';
import 'package:market_app/presentation/pages/main/pages/search/index.dart';
import 'package:market_app/presentation/pages/splash/index.dart';
import 'package:market_app/presentation/pages/main/pages/profile/index.dart';

class CRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const CSplashPage()
      ),
      // GoRoute(
      //   path: '/',
      //   name: 'home',
      //   builder: (context, state) => const CHomePage()
      // ),
      // GoRoute(
      //   path: '/',
      //   name: 'main',
      //   builder: (context, state) => const CMainPage()
      // ),
      ShellRoute(
        builder: (context, state, child) {
          return CMainPage(child: child, state: state);
        },
        routes: [
          GoRoute(
            path: '/list',
            name: 'list',
            builder: (context, state) => const CListPage(),
            // pageBuilder: (context, state) => const NoTransitionPage(child: CListPage())
          ),
          GoRoute(
            path: '/indexs',
            name: 'indexs',
            builder: (context, state) => const CIndexsPage(),
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const CSearchPage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const CProfilePage(),
          )
        ]
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const CLoginPage()
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const CSignupPage()
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const CRegisterPage()
      ),
      GoRoute(
        path: '/choose_mode',
        name: 'choose_mode',
        builder: (context, state) => const CChooseModePage()
      ),
      GoRoute(
        path: '/detail',
        name: 'detail',
        builder: (context, state) => const CDetailPage()
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page is not exist: ${state.uri.toString()}'),),
    ),
  );
}