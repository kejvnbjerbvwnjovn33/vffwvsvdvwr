
import 'package:injectable/injectable.dart';
import 'package:chicken_mines/common/services/music_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MusicBloc{
  MusicBloc(){
    _playMusic();
  }

  final BehaviorSubject<bool> _musicPlay = BehaviorSubject.seeded(false);


  Stream<bool> get isMusicPlay => _musicPlay.stream;

  void _playMusic() {
    MusicService.playMusicFromAsset();
    _musicPlay.add(true);
  }


  void handleMusic() {
    if (_musicPlay.value) {
      MusicService.pauseMusic();
      _musicPlay.add(false);
    } else {
      MusicService.playMusicFromAsset();
      _musicPlay.add(true);
    }
  }

  void stopMusic() {
    MusicService.stopMusic();
    _musicPlay.add(false);
  }
}