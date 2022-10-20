import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomMaps(
    leadingIcon: Icons.pin_drop_outlined, 
    trailingIcon: Icons.keyboard_arrow_right);
  }
}
