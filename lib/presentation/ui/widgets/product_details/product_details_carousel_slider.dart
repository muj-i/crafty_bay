import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ProductDetailsCarouselSlider extends StatefulWidget {
  const ProductDetailsCarouselSlider({super.key});

  @override
  State<ProductDetailsCarouselSlider> createState() => _ProductDetailsCarouselSliderState();
}

class _ProductDetailsCarouselSliderState extends State<ProductDetailsCarouselSlider> {
  final ValueNotifier<int> _selectedCarouselSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 280.0,
            viewportFraction: 1.0,
            autoPlay: false,
            
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
                   
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        ),
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
        Positioned
        (
          bottom: 10, left: 0, right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedCarouselSlider,
            builder: (context, value, _) {
              List<Widget> carouselDotList = [];
              for (int i = 0; i < 5; i++) {
                carouselDotList.add(Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                   
                    borderRadius: BorderRadius.circular(50),
                    color: value == i ? ColorPalette.primaryColor : Colors.white,
                  ),
                ),);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: carouselDotList,
              );
            },
          ),
        )
      ],
    );
  }
}
