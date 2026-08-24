import 'package:audioplayers/audioplayers.dart';

/// The two sounds a counter makes.
///
/// Sound is the primary feedback here, not decoration: the operator is looking
/// at the item and the shelf, not the screen, and a scan that failed silently
/// gets counted as one that worked. The two tones are deliberately unalike —
/// a rising two-blip against a low double-buzz — so they are told apart across
/// a noisy warehouse without looking up.
///
/// Players are kept alive for the life of the page and reused. Constructing an
/// `AudioPlayer` per scan costs tens of milliseconds on Android, which lands
/// exactly where the operator is already moving to the next item.
class ScanSounds {
  final AudioPlayer _ok = AudioPlayer();
  final AudioPlayer _fail = AudioPlayer();
  bool _ready = false;

  Future<void> load() async {
    try {
      // stop, not release: release frees the decoded buffer after every play
      // and the next scan pays to decode it again.
      await _ok.setReleaseMode(ReleaseMode.stop);
      await _fail.setReleaseMode(ReleaseMode.stop);
      await _ok.setSource(AssetSource('sounds/scan_ok.wav'));
      await _fail.setSource(AssetSource('sounds/scan_fail.wav'));
      await _ok.setVolume(1.0);
      await _fail.setVolume(1.0);
      _ready = true;
    } catch (_) {
      // A device with no audio route, or a locked-down handheld, must not stop
      // the counter working — the haptics still fire.
      _ready = false;
    }
  }

  Future<void> ok() => _play(_ok);
  Future<void> fail() => _play(_fail);

  Future<void> _play(AudioPlayer p) async {
    if (!_ready) return;
    try {
      // Seek to zero rather than resume: a scan during the tail of the last
      // tone must restart it, or fast scanning goes silent.
      await p.seek(Duration.zero);
      await p.resume();
    } catch (_) {
      // Never let feedback break the scan it is reporting on.
    }
  }

  Future<void> dispose() async {
    await _ok.dispose();
    await _fail.dispose();
  }
}
