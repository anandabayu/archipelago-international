import 'package:archipelagointernational/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final Function? onTap;
  final Color? borderColor;
  final double? borderRadius;

  const AppButton({
    super.key,
    required this.title,
    this.color = darkBlue,
    this.textColor = Colors.white,
    this.onTap,
    this.borderColor,
    this.borderRadius = 8,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        widget.onTap!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
          color: widget.color,
          border: widget.borderColor != null ? Border.all(color: widget.borderColor!) : null,
        ),
        height: 48,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: fontM(16, color: widget.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
