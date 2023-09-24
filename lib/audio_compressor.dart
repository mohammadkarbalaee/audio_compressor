
import 'audio_compressor_platform_interface.dart';

class AudioCompressor {
  Future<String?> getPlatformVersion() {
    return AudioCompressorPlatform.instance.getPlatformVersion();
  }
}
