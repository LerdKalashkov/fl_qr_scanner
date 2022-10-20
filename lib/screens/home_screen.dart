import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          
          final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);

          scanListProvider.deleteAllScans();
              },
            
        icon: const Icon(Icons.delete))],
          
        title: const Text('Maps'),
      ),
      
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
  }

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final UIProvider = Provider.of<UiProvider>(context);

    final currentIndex = UIProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

////How to Insert a row items in the db with json method.
    //final tempScan = ScanModel(id: 3 , type: 'http', value: 'http://google.com');
    //final initTemp = DBProvider.db.newScan(tempScan);
    // ignore: avoid_print
    //print(initTemp);

////how to Select a row from the db.
    // ignore: avoid_print
    //DBProvider.db.getScanById(4).then(((scan) => print(scan?.type)));

////how to select all items from db.
    //DBProvider.db.getAllScansItems().then(print);

    switch (currentIndex) {
      case 0:
        scanListProvider.addTypeScans('geo');
        return const AdressScreen();
      case 1:
        scanListProvider.addTypeScans('http');
        return const MapsScreen();
      default:
        return const MapsScreen();
    }
  }
}
