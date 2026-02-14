import 'dart:html' as html;

Future<void> downloadResume(String assetPath, {String? fileName}) async {
  final downloadName = fileName ?? assetPath.split('/').last;
  final anchor = html.AnchorElement(href: Uri.encodeFull(assetPath))
    ..setAttribute('download', downloadName)
    ..style.display = 'none';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}
