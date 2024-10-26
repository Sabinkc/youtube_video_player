import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YouTubePlayerScreen(),
    );
  }
}

class YouTubePlayerScreen extends StatefulWidget {
  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  // Initialize the controller with the NASA Perseverance Rover Landing video ID
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'Zi_XLOBDo_Y', // NASA Perseverance Rover Landing video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Video Player"),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              // Display the YouTube player
              player,
              SizedBox(height: 20),
              Text(
                "NASA Perseverance Rover Landing",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
