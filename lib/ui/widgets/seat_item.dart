import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({super.key, required this.status});

  /*
    0. Available
    1. Selected
    2. Unavailable
  */
  final int status;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor() {
      return (status == 0)
          ? kAvailableColor
          : (status == 1)
              ? kPrimaryColor
              : kUnavailableColor;
    }

    Color borderColor() {
      return (status == 0)
          ? kPrimaryColor
          : (status == 1)
              ? kPrimaryColor
              : kUnavailableColor;
    }

    child() {
      return (status == 1)
          ? Center(
              child: Text(
                'YOU',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            )
          : const Text('');
    }

    return Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: backgroundColor(),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child(),
    );
  }
}
