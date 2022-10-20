import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);

                scanListProvider.deleteAllScans();
              },
              icon: const Icon(Icons.delete))
        ],
        title: const Text('Maps'),
      ),
    );
  }
}
