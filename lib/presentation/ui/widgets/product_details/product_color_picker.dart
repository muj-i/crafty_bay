import 'package:crafty_bay/presentation/ui/widgets/product_details/section_title.dart';
import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Function(int selectIndex) onSelected;
  final int initialSelectedColor;
  const ProductColorPicker(
      {super.key,
      required this.colors,
      required this.onSelected,
      required this.initialSelectedColor});

  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  int _selectedColorIndex = 0;
  @override
  void initState() {
    _selectedColorIndex = widget.initialSelectedColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTittle(
          title: 'Color',
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _selectedColorIndex = index;
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: widget.colors[index],
                  child: _selectedColorIndex == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: widget.colors.length,
          ),
        ),
      ],
    );
  }
}
