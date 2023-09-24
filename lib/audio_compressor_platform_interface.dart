import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_compressor_method_channel.dart';

abstract class AudioCompressorPlatform extends PlatformInterface {
  /// Constructs a AudioCompressorPlatform.
  AudioCompressorPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudioCompressorPlatform _instance = MethodChannelAudioCompressor();

  /// The default instance of [AudioCompressorPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudioCompressor].
  static AudioCompressorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioCompressorPlatform] when
  /// they register themselves.
  static set instance(AudioCompressorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
