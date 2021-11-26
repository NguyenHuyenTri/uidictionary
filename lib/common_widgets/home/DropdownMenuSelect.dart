import 'package:flutter/material.dart';

class DropdownMenuSelect extends StatelessWidget {
  final String value;

  const DropdownMenuSelect({@required this.value}) :assert (value!=null);
  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem<String>(
      child: SizedBox(
        child: new Text(
          value.length <= 9
              ? value
              : value.substring(0, 8) + '...',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


