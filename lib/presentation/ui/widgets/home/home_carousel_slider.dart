import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedCarouselSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
            viewportFraction: 0.8,

            autoPlay: true,
          
            enlargeCenterPage: true,
enlargeFactor: 0.2,

            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) {
              _selectedCarouselSlider.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: ColorPalette.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image_not_supported_rounded, size: 60),
                        Text(
                          'Product $i',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedCarouselSlider,
          builder: (context, value, _) {
            List<Widget> carouselDotList = [];
            for (int i = 0; i < 5; i++) {
              carouselDotList.add(Container(
                width: value == i ? 30 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          value == i ? ColorPalette.primaryColor : Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                  color: value == i ? ColorPalette.primaryColor : null,
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselDotList,
            );
          },
        )
      ],
    );
  }
}
