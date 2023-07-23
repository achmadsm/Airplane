import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_success.png',
              height: 150,
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    'Well Booked 😍',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Are you ready to explore the new\n'
                    'world of experiences?',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                return Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                  (route) => false,
                );
              },
              width: 220,
              margin: const EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
