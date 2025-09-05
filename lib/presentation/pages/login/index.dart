import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app/widgets/button/index.dart';
import 'package:market_app/core/configs/assets/image/index.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/core/configs/colors/index.dart';

class CLoginPage extends StatelessWidget {
  const CLoginPage({super.key});

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
                image: AssetImage(CImages.introBG)
              )
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(CVectors.logo, width: 100, height: 100, fit: BoxFit.contain,),
                ),
                Spacer(),
                Text(
                  'Market Operating System',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 21,),
                Text(
                  'Welcome to Market Operating System, and earn more money...',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: CColors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center
                ),
                SizedBox(height: 20,),
                CBasicButton(
                  onPressed: () => {},
                  title: 'Login'
                )
              ],
            ),
          ),

          Container(
            color: Color.fromRGBO(0, 0, 0, 0.15)
          )
        ],
      ),
    );
  }
}
