import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  PasswordInputField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscurText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 8.0, horizontal: size.width * 0.10),
      child: TextFormField(
        obscureText: obscurText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              setState(() {
                obscurText = !obscurText;
              });
            },
            icon: obscurText == true
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        validator: widget.validator
        /* (value) {
          if (value!.isEmpty || !RegExp(r'^ [a-z A-Z]+$ ').hasMatch(value)) {
            return 'Entrer un nom valide';
          } else {
            return null;
          }
        } */
        ,
        onChanged: widget.onChanged,
      ),
    );
  }
}
