import 'package:flutter/material.dart';

class CardDivider extends StatelessWidget {
  const CardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Color(0xFFEDE2E2),
      thickness: 2,
      width: 2,
      indent: 25,
      endIndent: 10,
    );
  }
}
