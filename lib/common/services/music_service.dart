import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

@singleton
class MusicService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> playMusicFromAsset() async {
    try{
      final assetPath = "audio/music.mp3";
      _audioPlayer.play(AssetSource(assetPath));
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
    } catch (e) {
    }
  }

  static Future<void> pauseMusic() async {
    await _audioPlayer.pause();
  }

  static Future<void> stopMusic() async {
    await _audioPlayer.stop();
  }
}