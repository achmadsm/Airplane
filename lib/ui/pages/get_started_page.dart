import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_get_started.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Explore new world with us and let\n'
                  'yourself get an amazing experiences',
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                CustomButton(
                  title: 'Get Started',
                  width: 220,
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/sign-up'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
