import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app/widgets/button/index.dart';
import 'package:market_app/core/configs/assets/image/index.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/presentation/bloc/theme/cubit/index.dart';
import 'package:market_app/presentation/pages/auth/signup/index.dart';

class CChooseModePage extends StatelessWidget {
  const CChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(CImages.chooseModeBG)
              )
            ),
          ),

          Container(
            color: Color.fromRGBO(0, 0, 0, 0.15)
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(CVectors.logo, width: 100, height: 100, fit: BoxFit.contain,),
                ),
                Spacer(),
                Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 21,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(1, 32, 30, 30),
                                  shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(CVectors.moon, width: 40, height: 40, fit: BoxFit.contain, alignment: Alignment.center,),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          'Dark',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: CColors.grey
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CThemeCubit>().updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(1, 32, 30, 30),
                                  shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(CVectors.sun, width: 60, height: 60, fit: BoxFit.contain, alignment: Alignment.center,),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          'Light',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: CColors.grey
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                CBasicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const CSignupPage()
                      )
                    );
                  },
                  title: 'Continue'
                ),
                // Container(
                //   color: Color.fromRGBO(0, 0, 0, 0.15)
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
