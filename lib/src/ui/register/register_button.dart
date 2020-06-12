import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
    : _onPressed = onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      onPressed: _onPressed,
       //Texto con tamaño
      child: Text('Registrarme',style: TextStyle(fontSize: 18)),
      //color en bits
      color:  Color(0xFFBE3636),
    );
  }
}
  