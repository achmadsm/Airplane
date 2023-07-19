import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Select Your\n'
          'Favorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      Widget status(String name, String imageUrl) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 6),
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                ),
              )
            ],
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              status('Available', 'assets/icon_available.png'),
              status('Selected', 'assets/icon_selected.png'),
              status('Unavailable', 'assets/icon_unavailable.png'),
            ],
          ),
        ),
      );
    }

    Widget selectSeat() {
      Widget seatIndicator(String indicator) {
        return Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              indicator,
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 22,
        ),
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            // NOTE: SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                seatIndicator('A'),
                seatIndicator('B'),
                seatIndicator(''),
                seatIndicator('C'),
                seatIndicator('D'),
              ],
            ),

            // NOTE: SEAT 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(status: 2),
                const SeatItem(status: 2),
                seatIndicator('1'),
                const SeatItem(status: 0),
                const SeatItem(status: 2),
              ],
            ),

            // NOTE: SEAT 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 0),
                seatIndicator('2'),
                const SeatItem(status: 0),
                const SeatItem(status: 2),
              ],
            ),

            // NOTE: SEAT 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(status: 1),
                const SeatItem(status: 1),
                seatIndicator('3'),
                const SeatItem(status: 0),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE: SEAT 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 2),
                seatIndicator('4'),
                const SeatItem(status: 0),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE: SEAT 5
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(status: 0),
                const SeatItem(status: 0),
                seatIndicator('5'),
                const SeatItem(status: 0),
                const SeatItem(status: 0),
              ],
            ),

            // NOTE: YOUR SEAT
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your seat',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'A3, B3',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),

            // NOTE: TOTAL
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'IDR 540.000.000',
                    style: purpleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return CustomButton(
        title: 'Continue to Checkout',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CheckoutPage(),
          ),
        ),
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 40,
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkOutButton(),
        ],
      ),
    );
  }
}
