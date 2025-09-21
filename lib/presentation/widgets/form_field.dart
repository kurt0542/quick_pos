import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final bool isPasswordField;
  final String? fieldLabelText;
  final TextEditingController controller;

  const FormTextField({
    super.key,
    required this.isPasswordField,
    this.fieldLabelText,
    required this.controller,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    if (!widget.isPasswordField) {
      _isObscured = false;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(38, 159, 255, .25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: widget.controller,
        cursorColor: Colors.blueAccent,
        obscureText: widget.isPasswordField ? _isObscured : false,
        focusNode: _focusNode,
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: _isFocused ? null : widget.fieldLabelText,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: widget.fieldLabelText,
          labelStyle: TextStyle(color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
