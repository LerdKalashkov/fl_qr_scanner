import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:qr_reader/utils/utils.dart';

import '../providers/scan_list_provider.dart';
import '../themes/qr_theme.dart';

class CustomMaps extends StatelessWidget {
  final IconData leadingIcon;
  final IconData trailingIcon;

  const CustomMaps(
      {super.key, required this.leadingIcon, required this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    log(scans.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
          itemCount: scans.length,
          itemBuilder: ((_, i) => Dismissible(
                key: scanListProvider.uniqueKey,
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection direction) {
                  Provider.of<ScanListProvider>(context, listen: false)
                      .deleteIdScan(scans.length);
                },
                child: ListTile(
                  leading: Icon(leadingIcon, color: QrTheme.primaryColor),

                  title: Text(scans[i].value),
                  subtitle: Text(
                    scans[i].id.toString(),
                  ),
                  trailing: Icon(
                    trailingIcon,
                    color: QrTheme.primaryColor,
                  ),
                  // ignore: avoid_print
                  onTap: () => launchURL(context, scans[i]),
                ),
              ))),
    );
  }
}
