import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key, required this.destination});

  final DestinationModel destination;

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

      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                    const SeatItem(
                      id: 'A1',
                    ),
                    const SeatItem(
                      id: 'B1',
                    ),
                    seatIndicator('1'),
                    const SeatItem(
                      id: 'C1',
                    ),
                    const SeatItem(
                      id: 'D1',
                    ),
                  ],
                ),

                // NOTE: SEAT 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SeatItem(
                      id: 'A2',
                    ),
                    const SeatItem(
                      id: 'B2',
                    ),
                    seatIndicator('2'),
                    const SeatItem(
                      id: 'C2',
                    ),
                    const SeatItem(
                      id: 'D2',
                    ),
                  ],
                ),

                // NOTE: SEAT 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SeatItem(
                      id: 'A3',
                    ),
                    const SeatItem(
                      id: 'B3',
                    ),
                    seatIndicator('3'),
                    const SeatItem(
                      id: 'C3',
                    ),
                    const SeatItem(
                      id: 'D3',
                    ),
                  ],
                ),

                // NOTE: SEAT 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SeatItem(
                      id: 'A4',
                    ),
                    const SeatItem(
                      id: 'B4',
                    ),
                    seatIndicator('4'),
                    const SeatItem(
                      id: 'C4',
                    ),
                    const SeatItem(
                      id: 'D4',
                    ),
                  ],
                ),

                // NOTE: SEAT 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SeatItem(
                      id: 'A5',
                    ),
                    const SeatItem(
                      id: 'B5',
                    ),
                    seatIndicator('5'),
                    const SeatItem(
                      id: 'C5',
                    ),
                    const SeatItem(
                      id: 'D5',
                    ),
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
                      Expanded(
                        child: Text(
                          state.join(', '),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.fade,
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
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
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
        },
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
