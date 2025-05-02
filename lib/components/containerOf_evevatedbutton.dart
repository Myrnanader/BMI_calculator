import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class containerOf_inkwell extends StatefulWidget {
  final String text2;
  final String text1;

  const containerOf_inkwell({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  State<containerOf_inkwell> createState() => _containerOf_inkwellState();
}

class _containerOf_inkwellState extends State<containerOf_inkwell> {
  late double selected;
  double height = 170;
  double weight = 70;
  double age = 25;
  @override
  // void initState() {
  //   super.initState();
  //   widget.tex1 == "age" ? selected = age : selected = weight;
  // }
  @override
  void initState() {
    super.initState();
    selected = widget.text1 == "weight" ? weight : age;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 187,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: darkGray,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SizedBox(
        height: 250,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.text1,
                style: TextStyle(
                  color: lightGray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selected++;

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: CircleBorder(),
                  ),
                  child: Icon(Icons.add, size: 20),
                ),
                Text(
                  selected.round().toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    selected--;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: CircleBorder(),
                  ),
                  child: Center(child: Icon(Icons.remove, size: 20)),
                ),
              ],
            ),
            Center(
              child: Text(
                widget.text2,
                style: TextStyle(
                  color: lightGray,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
