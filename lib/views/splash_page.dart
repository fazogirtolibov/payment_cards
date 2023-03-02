import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_images.dart';
import '../utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  nextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.appLogo),
              const SizedBox(height: 20),
              Text(
                'Transactions that are fast and easy.',
                style: GoogleFonts.raleway()
                    .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
