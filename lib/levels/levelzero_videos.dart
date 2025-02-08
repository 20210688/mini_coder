import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_coder/levels/player.dart';
import 'package:mini_coder/videos/levelzero.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class VideoState {}

class VideosInitial extends VideoState {}

class VideosLoaded extends VideoState {
  final List<String> videoUrls;
  VideosLoaded(this.videoUrls);
}

class VideosError extends VideoState {
  final String message;
  VideosError(this.message);
}

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideosInitial()) {
    loadVideos();
  }
  Future<void> loadVideos() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        emit(VideosError('No internet connection.'));
      } else {
        emit(VideosLoaded(zerourls));
      }
    } catch (e) {
      emit(VideosError('Failed to load videos: ${e.toString()}'));
    }
  }
}

class LevelzeroVideos extends StatelessWidget {
  const LevelzeroVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Level Zero Videos'),
          centerTitle: true,
          backgroundColor: const Color(0xFF2AAA8A),
          elevation: 0,
        ),
        body: BlocBuilder<VideoCubit, VideoState>(
          builder: (context, state) {
            if (state is VideosInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is VideosError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => context.read<VideoCubit>().loadVideos(),
                      child: const Text('Retry Connection'),
                    ),
                  ],
                ),
              );
            }
            if (state is VideosLoaded) {
              return ListView.builder(
                itemCount: state.videoUrls.length,
                itemBuilder: (context, index) {
                  final videoID = YoutubePlayer.convertUrlToId(
                    state.videoUrls[index],
                  );
                  if (videoID == null) {
                    return const ListTile(
                      title: Text('Invalid video URL'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlayerScreen(videoId: videoID),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          YoutubePlayer.getThumbnail(videoId: videoID),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
