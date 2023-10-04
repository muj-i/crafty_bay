import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/section_title.dart';
import 'package:flutter/material.dart';

class ProductSizePicker extends StatefulWidget {
  final List<String> sizes;
  final Function(int selectIndex) onSelected;
  final int initialSelectedSize;

  const ProductSizePicker(
      {super.key,
      required this.sizes,
      required this.onSelected,
      required this.initialSelectedSize});

  @override
  State<ProductSizePicker> createState() => _ProductSizePickerState();
}

class _ProductSizePickerState extends State<ProductSizePicker> {
  int _selectedSizeIndex = 0;
  @override
  void initState() {
    _selectedSizeIndex = widget.initialSelectedSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTittle(
          title: 'Size',
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
                  _selectedSizeIndex = index;
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
                      color: _selectedSizeIndex == index
                          ? ColorPalette.primaryColor
                          : Colors.grey.shade600,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _selectedSizeIndex == index
                          ? ColorPalette.primaryColor
                          : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        widget.sizes[index],
                        style: TextStyle(
                            fontSize: 18,
                            color: _selectedSizeIndex == index
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
            itemCount: widget.sizes.length,
          ),
        ),
      ],
    );
  }
}
