import 'dart:math';
import 'package:bmi_calculator/widgets/colors.dart';
import 'package:bmi_calculator/widgets/gender_container.dart';
import 'package:flutter/material.dart';
import '../components/containerOf_evevatedbutton.dart';
import '../widgets/topcircles.dart';
import 'result_screen.dart';
import '../components/elevated_Button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool isMale = true;
  double height = 170; // cm
  double weight = 70;
  double age = 25;

  // (Cm, Ft, In)
  String selectedUnit = "Cm";

  
  double convertHeight(String unit) {
    switch (unit) {
      case "Ft":
        return height / 30.48; 
      case "In":
        return height / 2.54; 
      default:
        return height; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkerColor,
      appBar: AppBar(
        backgroundColor: darkerColor,
        leading: Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(left: 10),
          child: const Image(image: AssetImage('assets/BMI.png')),
        ),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GenderContainer(
                  text: 'male',
                  isMale: isMale,
                  onTap: () {
                    isMale = true;
                    setState(() {});
                  },
                ),
                GenderContainer(
                  text: 'female',
                  isMale: isMale,
                  onTap: () {
                    isMale = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
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
              child: Column(
                children: [
                  UnitSelector(
                    onUnitSelected: (unit) {
                      setState(() {
                        selectedUnit = unit; // update selected unit
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        convertHeight(selectedUnit).toStringAsFixed(2), //after converting height
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Slider(
                    min: 50,
                    max: 250,
                    value: height,
                    thumbColor: Colors.yellow,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        height = value; // تحديث الارتفاع
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                containerOf_inkwell(text1: "weight", text2: "kg"),
                const SizedBox(width: 8),
                containerOf_inkwell(text1: "age", text2: "years"),
              ],
            ),
          ),
          CustomElevatedButton(
            text: 'calculate',
            icon: Icons.calculate,
            onPressed: () {
              double bmi = weight / pow(height / 100, 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(result: bmi),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}