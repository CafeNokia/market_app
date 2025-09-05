import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app/widgets/button/index.dart';
import 'package:market_app/core/configs/assets/image/index.dart';
import 'package:market_app/core/configs/assets/vector/index.dart';
import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/presentation/pages/choose_mode/index.dart';

class CStartPage extends StatelessWidget {
  const CStartPage({super.key});

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
                  'Market Operating System',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 21,),
                Text(
                  'Welcome to Market Operating System, and earn more money...',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: CColors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center
                ),
                const SizedBox(height: 20,),
                CBasicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const CChooseModePage()
                      )
                    );
                  },
                  title: 'Get Started'
                ),
                Container(
                  color: Color.fromRGBO(0, 0, 0, 0.15)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
