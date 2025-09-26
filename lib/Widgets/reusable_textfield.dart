import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool readOnly;       // ✅ tambahan
  final VoidCallback? onTap; // ✅ tambahan

  const ReusableTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      readOnly: widget.readOnly,    // ✅ support readOnly
      onTap: widget.onTap,          // ✅ support onTap
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
