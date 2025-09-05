import 'package:flutter/material.dart';
// import 'package:market_app/core/configs/colors/index.dart';
import 'package:market_app/core/configs/videos/index.dart';
import 'package:market_app/widgets/video/players/vlc/index.dart';

class CIndexsPage extends StatelessWidget {
  const CIndexsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const  Center(child: Text("Indexs Page", style: TextStyle(fontSize: 24, color: CColors.primary)));
    return Scaffold(
      body: Center(
        child: CVlcPlayer(videoUrl: CVideos.defaultFlvVideoSrc),
      ),
    );
  }
}