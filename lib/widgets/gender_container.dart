import 'package:flutter/material.dart';
import 'colors.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.isMale,
  });
  final String text;
  final Function() onTap;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                (isMale == true && text == 'male') ||
                        (isMale == false && text == 'female')
                    ? darkColor
                    : darkGray,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                text == 'male' ? Icons.male : Icons.female,
                size: 80,
                color: Colors.white,
              ),
              Text(text, style: TextStyle(color: lightGray, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
