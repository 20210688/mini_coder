import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class playerScreen extends StatefulWidget{
  const playerScreen({super.key,required this.videoId});
  final String videoId;

  @override
  State<playerScreen> createState()=>_PlayerScreenState();
}

class _PlayerScreenState extends State<playerScreen> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId:widget.videoId ,
  flags: YoutubePlayerFlags(
  autoPlay: true,
  mute: true,
  ),);
  @override
  void dispose(){
   super.dispose();
   _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2AAA8A),
          title: Text("player")),
      body: YoutubePlayer(controller: _controller),
      backgroundColor: const Color(0xFF2AAA8A),

    );
    throw UnimplementedError();
  }}
