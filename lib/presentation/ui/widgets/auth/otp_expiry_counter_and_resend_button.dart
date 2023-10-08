import 'dart:async';

import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class OtpExpiryCounterAndResendButton extends StatefulWidget {
  final Function onPressed;
  const OtpExpiryCounterAndResendButton({super.key, required this.onPressed});

  @override
  State<OtpExpiryCounterAndResendButton> createState() =>
      _OtpExpiryCounterAndResendButtonState();
}

class _OtpExpiryCounterAndResendButtonState
    extends State<OtpExpiryCounterAndResendButton> {
  int _secondsRemaining = 120;
  late Timer _timer;
  bool _showCountdown = true;

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
        if (_secondsRemaining == 1) {
          timer.cancel();
          _showCountdown = false;
          setState(() {});
        } else {
          _secondsRemaining--;
          setState(() {});
        }
      },
    );
  }

  void resetTimer() {
    _secondsRemaining = 120;
    _showCountdown = true;
    startTimer();
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _showCountdown,
      replacement: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Code has expired.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () {
              widget.onPressed();
              resetTimer();
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(2),
              foregroundColor: ColorPalette.primaryColor,
            ),
            child: const Text(
              'Resend Code',
            ),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.grey),
          children: [
            const TextSpan(text: '\nThis code will expire in '),
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
    );
  }
}
