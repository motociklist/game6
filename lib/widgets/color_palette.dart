import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;
  final ScrollController scrollController;

  const ColorPalette({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: isMobile ? 80 : 70,
      decoration: BoxDecoration(
        color: !isMobile ? Colors.grey[100] : Colors.transparent,
        border: !isMobile
            ? Border(
                top: BorderSide(color: Colors.grey[300]!),
                bottom: BorderSide(color: Colors.grey[300]!),
              )
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : 20,
        vertical: isMobile ? 10 : 12,
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: colors.map((color) {
            return _ColorCircle(
              color: color,
              isSelected: selectedColor == color,
              onTap: () => onColorSelected(color),
              isMobile: isMobile,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;

  const _ColorCircle({
    required this.color,
    required this.isSelected,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colorSize = isMobile ? 50.0 : 45.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: colorSize,
        height: colorSize,
        margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 10 : 12,
          vertical: isMobile ? 10 : 0,
        ),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey[400]!,
            width: isSelected ? (isMobile ? 4 : 3) : (isMobile ? 2 : 1.5),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}

