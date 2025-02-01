import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class PlayerState {
  final String videoId;
  final bool autoPlay;
  final bool mute;

  const PlayerState({
    required this.videoId,
    this.autoPlay = true,
    this.mute = true,
  });
}


class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit(String videoId)
      : super(PlayerState(videoId: videoId));
}

class PlayerScreen extends StatefulWidget {
  final String videoId;

  const PlayerScreen({super.key, required this.videoId});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final YoutubePlayerController _controller;
  late final PlayerCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = PlayerCubit(widget.videoId);
    _controller = YoutubePlayerController(
      initialVideoId: _cubit.state.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: _cubit.state.autoPlay,
        mute: _cubit.state.mute,
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2AAA8A),
          title: const Text("Player"),
        ),
        body: BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            return YoutubePlayer(
              controller: _controller,
            );
          },
        ),
        backgroundColor: const Color(0xFF2AAA8A),
      ),
    );
  }
}
