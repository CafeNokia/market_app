import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class CVlcPlayer extends StatefulWidget {
  final String videoUrl;
  const CVlcPlayer({super.key, required this.videoUrl});

  @override
  State<CVlcPlayer> createState() => _CVlcPlayerState();
}

class _CVlcPlayerState extends State<CVlcPlayer> {
  late VlcPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _controller = VlcPlayerController.network(
      widget.videoUrl,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    // await _controller.initialize();

    // setState(() {
    //   _isInitialized = true;
    //   _controller.play();
    // });
    print(_controller.value.isInitialized);
    _controller.addListener(() {
      if (_controller.value.isInitialized && !_isInitialized) {
        setState(() {
          _isInitialized = true;
        });
      }
    });
  }

  @override
  void dispose() async {
    _controller.dispose();
    super.dispose();
    // await _controller.stopRendererScanning();
    // await _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vlc Player')),
      body: _isInitialized
        ? VlcPlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            placeholder: const Center(child: CircularProgressIndicator()),
          )
        // : const Center(child: Text('initializing...')),
        : const Center(child: CircularProgressIndicator()),
    );
  }
}