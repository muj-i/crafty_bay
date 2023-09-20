import 'package:crafty_bay/presentation/ui/utils/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreensUpperParts extends StatelessWidget {
  const AuthScreensUpperParts({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 120,
        ),
        Center(
          child: SvgPicture.asset(
            AppImageAssets.craftyBayLogoSVG,
            width: 120,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 28, color: Colors.grey[800]),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}