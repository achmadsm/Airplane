import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:airplane/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    Widget route() {
      Widget airport(int status) {
        /*
          0. Departure
          1. Arrival
         */
        return Column(
          crossAxisAlignment:
              status == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              'CGK',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Tangerang',
              style: greyTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image.asset('assets/image_checkout.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                airport(0),
                airport(1),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return TransactionCard(transaction: transaction);
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image_card.png'),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: const EdgeInsets.only(right: 6),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/icon_plane.png',
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Pay',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currencyFormat(state.user.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: regular,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Current Balance',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/success',
              (route) => false,
            );
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Pay Now',
            onPressed: () =>
                context.read<TransactionCubit>().createTransaction(transaction),
            margin: const EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
