import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _isHovering = false;

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _password = FocusNode();
  final _passwordVerification = FocusNode();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordVerificationTextController = TextEditingController();

  String responseMessage = '';

  Future<void> CreateUser(String name, String email, String password) async {
    const url = 'https://example.com/api/data'; 
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'name': name, 
      'email': email, 
      'password': password, 
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          responseMessage = "Success: ${responseData['message'] ?? 'OK'}";
        });
      } else {
        setState(() {
          responseMessage = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        responseMessage = "Exception: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    for (var node in [
      _nameFocus,
      _emailFocus,
      _password,
      _passwordVerification,
    ]) {
      node.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _password.dispose();
    _passwordVerification.dispose();
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
        final width = constraints.maxWidth;

        double formWidth;
        EdgeInsets padding;

        if (width < 600) {
          formWidth = width * 0.9; // mobile
          padding = const EdgeInsets.all(16);
        } else if (width < 1100) {
          formWidth = width * 0.7; // tablet
          padding = const EdgeInsets.all(24);
        } else {
          formWidth = width * 0.5; // desktop
          padding = const EdgeInsets.all(10);
        }

        return Center(
          child: SizedBox(
            width: formWidth,
            child: SingleChildScrollView(
              child: Container(
                padding: padding,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Contact Me",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Name
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _nameFocus,
                        controller: _nameTextController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: _nameTextController.text.isNotEmpty
                            ? inputDecoration('', _nameFocus.hasFocus)
                            : inputDecoration('Name', _nameFocus.hasFocus),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    Container(
                      decoration: shadow,
                      child: TextFormField(
                        focusNode: _emailFocus,
                        controller: _emailTextController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        decoration: _emailTextController.text.isNotEmpty
                            ? inputDecoration('', _emailFocus.hasFocus)
                            : inputDecoration('Email', _emailFocus.hasFocus),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Subject
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _password,
                        controller: _passwordTextController,
                        obscureText: true,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: _passwordTextController.text.isNotEmpty
                            ? inputDecoration('', _password.hasFocus)
                            : inputDecoration('Subject', _password.hasFocus),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Message
                    Container(
                      decoration: shadow,
                      child: TextField(
                        focusNode: _passwordVerification,
                        controller: _passwordVerificationTextController,
                        obscureText: true,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        maxLines: 10,
                        decoration:
                            _passwordVerificationTextController.text.isNotEmpty
                            ? inputDecoration(
                                '',
                                _passwordVerification.hasFocus,
                              )
                            : inputDecoration(
                                'Message',
                                _passwordVerification.hasFocus,
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),

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
                        onPressed: () {
                          // send create user request
                        },
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
