import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/section_title.dart';
import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  final List<String> colors;
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
                  widget.onSelected(index);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: _selectedColorIndex == index
                          ? ColorPalette.primaryColor
                          : Colors.grey.shade600,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _selectedColorIndex == index
                          ? ColorPalette.primaryColor
                          : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        widget.colors[index],
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedColorIndex == index
                                ? Colors.white
                                : Colors.grey.shade600),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 5,
              );
            },
            itemCount: widget.colors.length,
          ),
        ),
      ],
    );
  }
}
