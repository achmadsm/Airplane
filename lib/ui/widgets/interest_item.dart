import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestItem extends StatelessWidget {
  const InterestItem({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            'assets/icon_check.png',
            fit: BoxFit.cover,
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
