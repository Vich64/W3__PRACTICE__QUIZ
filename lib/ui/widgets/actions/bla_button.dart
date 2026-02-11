import 'package:flutter/material.dart';
import '../../theme/theme.dart';

/// BlaButton is a reusable button widget used throughout the application.
/// It supports primary and secondary styles, with or without icons.
///
/// Parameters:
/// - [label]: The text to display on the button (required)
/// - [textColor]: The color of the text (required)
/// - [backgroundColor]: The background color (optional, defaults to BlaColors.primary)
/// - [icon]: Optional icon to display before the text
/// - [iconColor]: The color of the icon (optional, defaults to white)
/// - [onPressed]: Callback function when button is pressed (optional)
class BlaButton extends StatelessWidget {
  BlaButton({
    super.key, 
    required this.label,
    required this.textColor,
    this.icon, 
    this.iconColor = Colors.white, 
    this.onPressed,
    Color? backgroundColor
  }) : backgroundColor = backgroundColor ?? BlaColors.primary;
  
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final IconData? icon;
  final Color iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor, size: 20),
            SizedBox(width: 8),
          ],
          Text(
            label, 
            style: BlaTextStyles.button.copyWith(color: textColor)
          ),
        ],
      ),
    );
  }
}