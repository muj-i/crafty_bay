import 'dart:async';

import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class OtpExpiryCounterAndResendButton extends StatefulWidget {
  const OtpExpiryCounterAndResendButton({super.key});

  @override
  State<OtpExpiryCounterAndResendButton> createState() => _OtpExpiryCounterAndResendButtonState();
}

class _OtpExpiryCounterAndResendButtonState extends State<OtpExpiryCounterAndResendButton> {
  int _secondsRemaining = 120;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 120;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_secondsRemaining > 0)
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.grey),
              children: [
                const TextSpan(text: 'This code will expire in '),
                TextSpan(
                  text: '${_secondsRemaining}s', 
                  style: const TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        if (_secondsRemaining == 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Code has expired',
                  style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {
                  resetTimer();
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorPalette.primaryColor,
                ),
                child: const Text('Resend Code'),
              ),
            ],
          ),
      ],
    );
  }
}
