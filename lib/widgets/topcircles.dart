import 'package:flutter/material.dart';
import 'colors.dart';

class UnitSelector extends StatefulWidget {
  const UnitSelector({super.key});

  @override
  _UnitSelectorState createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  String selected = 'In';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 200),

        _buildCircleButton('In', selected == 'In'),

        SizedBox(width: 8),

        _buildCircleButton('Ft', selected == 'Ft'),

        SizedBox(width: 8),

        _buildCircleButton('Cm', selected == 'Cm'),
      ],
    );
  }

  Widget _buildCircleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = label;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? buttonColor : Colors.grey[300],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
