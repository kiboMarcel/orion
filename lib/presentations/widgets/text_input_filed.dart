import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  TextInputField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 8.0, horizontal: size.width * 0.10),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator
        /* (value) {
          if (value!.isEmpty || !RegExp(r'^ [a-z A-Z]+$ ').hasMatch(value)) {
            return 'Entrer un nom valide';
          } else {
            return null;
          }
        } */
        ,
        onChanged: onChanged,
      ),
    );
  }
}
