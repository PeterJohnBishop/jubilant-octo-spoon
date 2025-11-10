import 'package:flutter/material.dart';

class SubmitEmailButton extends StatefulWidget {
  final String name;
  final String email;
  final String subject;
  final String message;

  const SubmitEmailButton({
    super.key,
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  @override
  State<SubmitEmailButton> createState() => _SubmitEmailButtonState();
}

class _SubmitEmailButtonState extends State<SubmitEmailButton> {
  var _isHovering = false;
  late String name;
  late String email;
  late String subject;
  late String message;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    subject = widget.subject;
    message = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: _isHovering ? Colors.black : Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Handle the submission logic using
          // name, email, subject, and message variables.
        },
        child: Text("Submit"),
      ),
    );
  }
}
