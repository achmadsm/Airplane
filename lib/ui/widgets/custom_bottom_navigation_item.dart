import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    bool isSelected;
    (context.watch<PageCubit>().state == index)
        ? isSelected = true
        : isSelected = false;

    return GestureDetector(
      onTap: () => context.read<PageCubit>().setPage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: isSelected ? kPrimaryColor : kGreyColor,
          ),
          Container(
            width: 32,
            height: 2,
            decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : kTransparentColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
