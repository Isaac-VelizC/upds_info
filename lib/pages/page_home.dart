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
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  Future<void> _initializeVideoController() async {
    videoController = VideoPlayerController.asset('assets/BACKGROUND.mp4');
    await videoController!.initialize();
    videoController!.seekTo(Duration.zero);
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: videoController!,
        autoPlay: true,
        looping: true,
        showControls: false,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController?.dispose();
    videoController?.dispose();
  }

  void _navigateToCarreraPage(String tipo) {
    // Detener y liberar los controladores de video antes de navegar
    _chewieController?.pause();
    videoController?.pause();
    videoController?.dispose();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageCarrera(tipo: tipo),
      ),
    ).then((_) {
      // Esta parte se ejecutará cuando regreses de PageCarrera
      _initializeVideoController();
    });
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: updsFondos,
        elevation: 0,
        onPressed: () {
          if (videoController != null) {
            videoController!.seekTo(Duration.zero);
            videoController!.play();
          }
        },
        child: const Icon(
          Icons.replay,
          color: Colors.transparent,
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
}
