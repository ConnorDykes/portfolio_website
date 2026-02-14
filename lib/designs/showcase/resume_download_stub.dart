import 'package:url_launcher/url_launcher.dart';

Future<void> downloadResume(String assetPath, {String? fileName}) async {
  final uri = Uri.parse(Uri.encodeFull(assetPath));
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }
}
