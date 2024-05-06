// import 'package:just_audio/just_audio.dart';
import 'dart:js' as js;

import 'package:get/get.dart';

class AudioWeb {
  static const url = 'https://firebasestorage.googleapis.com/v0/b/weddinginvitation-7436a.appspot.com/o/cinta.mp3?alt=media&token=9da979e9-4821-4b32-97bb-6c9af91b817a';


  static void playAudio() {
    var urlBasedPlatform = GetPlatform.isMobile ? 'assets/audio/cinta.mp3' : url;
    // js.context.callMethod('playAudio', ['assets/audio/cinta.mp3']);
    js.context.callMethod('playAudio', [url]);
  }

  static void pauseAudio() {
    js.context.callMethod('pause');
  }

  static void resumeAudio() {
    js.context.callMethod('resume');
  }

  static void stopAudio() {
    js.context.callMethod('stopAudio');
  }
}