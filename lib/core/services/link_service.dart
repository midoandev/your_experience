import 'package:url_launcher/url_launcher.dart';

class LinkService {
  const LinkService._();

  /// Opens [url] in a new tab (web) / external app. Returns false on failure
  /// so the caller can show feedback.
  static Future<bool> open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    try {
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: uri.scheme == 'mailto' ? '_self' : '_blank',
      );
    } catch (_) {
      return false;
    }
  }
}
