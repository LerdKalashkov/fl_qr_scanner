import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;

  if (scan.type == 'http') {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(scan.value);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
