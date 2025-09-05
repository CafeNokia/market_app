import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_app/common/helpers/theme/index.dart';
import 'package:market_app/presentation/pages/auth/register/index.dart';
import 'package:market_app/presentation/pages/auth/signin/index.dart';
import 'package:market_app/widgets/button/index.dart';
import 'package:market_app/core/configs/assets/image/index.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/widgets/layout/appbar/index.dart';

class CSignupPage extends StatelessWidget {
  const CSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(CVectors.topPattern, width: 200, height: 200,),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(CVectors.bottomPattern, width: 200, height: 200,),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(CImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(CVectors.logo, width: 100, height: 100,),
                  const SizedBox(height: 55,),
                  Text(
                    'Enjoy to MOS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                    ),
                  ),
                  const SizedBox(height: 21,),
                  Text(
                    'Enjoy to MOS, market operating system is a tool that you could use to earn money...',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: CColors.grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CBasicButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const CRegisterPage()
                              )
                            );
                          },
                          title: 'Register'
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const CSigninPage()
                              )
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode ? Colors.white : Colors.black
                            ),
                          )
                        )
                      ),
                    ],
                  )
                ],
              )
            )
          )
        ],
      ),
    );
  }
}