import 'package:flutter_test/flutter_test.dart';
import 'package:audio_compressor/audio_compressor.dart';
import 'package:audio_compressor/audio_compressor_platform_interface.dart';
import 'package:audio_compressor/audio_compressor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioCompressorPlatform
    with MockPlatformInterfaceMixin
    implements AudioCompressorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudioCompressorPlatform initialPlatform = AudioCompressorPlatform.instance;

  test('$MethodChannelAudioCompressor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioCompressor>());
  });

  test('getPlatformVersion', () async {
    AudioCompressor audioCompressorPlugin = AudioCompressor();
    MockAudioCompressorPlatform fakePlatform = MockAudioCompressorPlatform();
    AudioCompressorPlatform.instance = fakePlatform;

    expect(await audioCompressorPlugin.getPlatformVersion(), '42');
  });
}
