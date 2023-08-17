import 'package:flutter/material.dart';
import 'package:upds_info/pages/page_carreras.dart';
import 'package:upds_info/themes/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  Future<void> _initializeVideoController() async {
    final videoController =
        VideoPlayerController.asset('assets/BACKGROUND.mp4');
    await videoController.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: videoController,
        autoPlay: true,
        looping: true,
        showControls: false,
      );
    });
  }

  void _navigateToCarreraPage(String tipo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageCarrera(tipo: tipo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: updsFondos,
        child: Stack(
          children: [
            if (_chewieController != null)
              Positioned.fill(
                child: Chewie(controller: _chewieController!),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      _buildCarreraImage('PRE', 'assets/Logo-Presencial.png'),
                      const SizedBox(width: 20),
                      _buildCarreraImage('SEMI', 'assets/Logo-Semi.png'),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarreraImage(String tipo, String imagePath) {
    return Flexible(
      child: InkWell(
        onTap: () => _navigateToCarreraPage(tipo),
        child: Image.asset(imagePath),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController?.dispose();
  }
}
