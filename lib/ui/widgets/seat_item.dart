import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/seat_cubit.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    super.key,
    required this.id,
    this.isAvailable = true,
  });

  /*
    0. Available
    1. Selected
    2. Unavailable
  */
  final bool isAvailable;
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    Color backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    Color borderColor() {
      return (!isAvailable) ? kUnavailableColor : kPrimaryColor;
    }

    child() {
      return (isSelected)
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

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
