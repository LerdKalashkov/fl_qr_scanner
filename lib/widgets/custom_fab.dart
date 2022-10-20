import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.filter_center_focus_outlined),
        onPressed: () async {

          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#4B0082', 'Cancel', false, ScanMode.QR);
    
          if (barcodeScanRes == '-1') {
            return;
          }

          // ignore: use_build_context_synchronously
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          final newScan = await scanListProvider.newScan(barcodeScanRes);

          // ignore: use_build_context_synchronously
          launchURL(context, newScan);
          // ignore: avoid_print
          // ignore: avoid_print
        });
  }
}
