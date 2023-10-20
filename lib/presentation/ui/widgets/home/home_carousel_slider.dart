import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/slider_model_data.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<SliderModelData> sliders;
  const HomeCarouselSlider({super.key, required this.sliders});

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
            height: 210.0,
            // viewportFraction: 0.8,
            viewportFraction: 1.0,
            autoPlay: true,
            // enlargeCenterPage: true,
            enlargeFactor: 0.2,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) {
              _selectedCarouselSlider.value = index;
            },
          ),
          items: widget.sliders.map(
            (sliderModelData) {
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sliderModelData.title ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Stack(
                          children: [
                            Image.network(
                              sliderModelData.image ?? '',
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              left: 35,
                              top: 10,
                              child: SizedBox(
                                height: 80,
                                child: Image.asset(
                                  'assets/images/trending.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          sliderModelData.price ?? '',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 5),
                          child: SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Colors.white,
                                  foregroundColor: ColorPalette.primaryColor,
                                ),
                                child: const Text('Buy Now'),
                                onPressed: () {}),
                          ),
                        )
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
            for (int i = 0; i < widget.sliders.length; i++) {
              carouselDotList.add(Container(
                width: value == i ? 11 : 11,
                height: 11,
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
