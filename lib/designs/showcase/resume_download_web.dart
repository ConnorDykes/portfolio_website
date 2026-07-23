import 'dart:html' as html;

import 'package:flutter/services.dart' show rootBundle;

Future<void> downloadResume(String assetPath, {String? fileName}) async {
  final downloadName = fileName ?? assetPath.split('/').last;
  final byteData = await rootBundle.load(assetPath);
  final bytes = byteData.buffer.asUint8List(
    byteData.offsetInBytes,
    byteData.lengthInBytes,
  );

  final blob = html.Blob([bytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', downloadName)
    ..style.display = 'none';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();

  html.Url.revokeObjectUrl(url);
}
