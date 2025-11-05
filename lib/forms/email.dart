import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return const EmailForm();
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _subjectFocus = FocusNode();
  final _messageFocus = FocusNode();
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    for (var node in [
      _nameFocus,
      _emailFocus,
      _phoneFocus,
      _subjectFocus,
      _messageFocus,
    ]) {
      node.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _subjectFocus.dispose();
    _messageFocus.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration(String label, bool hasFocus) {
    return InputDecoration(
      labelText: hasFocus ? null : label,
      labelStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shadow = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 6,
          spreadRadius: -4,
          offset: const Offset(0, 2),
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double formWidth = (width * 0.95).clamp(1200, 1920);
        double formHeight = (height * 0.95).clamp(600, 1080);

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: formWidth,
              maxHeight: formHeight,
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Contact Me",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(height: 24),

                    // Name Field
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _nameFocus,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: inputDecoration(
                          'Name',
                          _nameFocus.hasFocus,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _emailFocus,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDecoration(
                          'Email',
                          _emailFocus.hasFocus,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Phone Field
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _phoneFocus,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.phone,
                        decoration: inputDecoration(
                          'Phone',
                          _phoneFocus.hasFocus,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Subject Field
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _subjectFocus,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: inputDecoration(
                          'Subject',
                          _subjectFocus.hasFocus,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Message Field
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _messageFocus,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        maxLines: 10,
                        decoration: inputDecoration(
                          'Message',
                          _messageFocus.hasFocus,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovering = true),
                      onExit: (_) => setState(() => _isHovering = false),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: _isHovering
                              ? Colors.black
                              : Colors.grey,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 32,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
