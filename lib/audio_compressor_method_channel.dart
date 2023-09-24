import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audio_compressor_platform_interface.dart';

/// An implementation of [AudioCompressorPlatform] that uses method channels.
class MethodChannelAudioCompressor extends AudioCompressorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_compressor');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
