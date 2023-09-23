import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final String? subTitle;
  final Widget button;
  const BottomContainer({
    super.key,
    required this.title,
    this.subTitle,
    required this.button,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: ColorPalette.primaryColor.withOpacity(0.12),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 2,
              ),
              if (subTitle != null)
                Text(
                  subTitle.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: ColorPalette.primaryColor),
                ),
            ],
          ),
          SizedBox(
            height: 38,
            child: button,
          )
        ],
      ),
    );
  }
}
