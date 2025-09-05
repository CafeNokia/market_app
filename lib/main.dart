import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/configs/theme/index.dart';
import 'package:market_app/http/dio/index.dart';
import 'package:market_app/presentation/bloc/theme/cubit/index.dart';
// import 'package:market_app/presentation/pages/splash/index.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:market_app/router/index.dart';
import 'package:path_provider/path_provider.dart';
// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  CDioClient().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CThemeCubit())
      ],
      child: BlocBuilder<CThemeCubit, ThemeMode>(
        // builder: (context, mode) => MaterialApp(
        //   theme: CTheme.lightTheme,
        //   darkTheme: CTheme.darkTheme,
        //   themeMode: mode,
        //   debugShowCheckedModeBanner: false,
        //   home: const CSplashPage()
        // ),
        builder: (context, mode) => MaterialApp.router(
          theme: CTheme.lightTheme,
          darkTheme: CTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          routerConfig: CRouter.router,
        ),
      )
    );
    // return MaterialApp(
    //   theme: CTheme.lightTheme,
    //   debugShowCheckedModeBanner: false,
    //   home: const CSplashPage(),
    // );
  }
}
