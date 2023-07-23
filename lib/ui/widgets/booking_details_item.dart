import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem({
    super.key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  });

  final String title;
  final String valueText;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
