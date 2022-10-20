import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomMaps(
        leadingIcon: Icons.south_america_outlined,
        trailingIcon: Icons.keyboard_arrow_right);
  }
}
