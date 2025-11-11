import 'package:flutter/material.dart';

class navTextButton extends StatefulWidget {
  final int index;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const navTextButton({
    super.key,
    required this.index,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<navTextButton> createState() => _navTextButtonState();
}

class _navTextButtonState extends State<navTextButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color get _textColor {
    if (_isPressed || widget.isSelected || _isHovered) {
      return Colors.black;
    }
    return Colors.grey[600]!;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            color: _textColor,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}