import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final UIProvider = Provider.of<UiProvider>(context);

    final currentIndex = UIProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (i) => UIProvider.selectedMenuOption = i,
      currentIndex: currentIndex,
      backgroundColor: Colors.indigo,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.south_america),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          label: 'Adress',
        ),
      ],
    );
  }
}
