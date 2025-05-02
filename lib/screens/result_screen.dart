import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import '../components/elevated_Button.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.result});
  final double result;

  String get healthiness {
    String healthinessString = '';

    if (result < 18.5) {
      healthinessString = "Underweight";
    } else if (result >= 18.5 && result < 24.9) {
      healthinessString = "Normal weight";
    } else if (result >= 25 && result < 29.9) {
      healthinessString = "Overweight";
    } else {
      healthinessString = "Obesity";
    }

    return healthinessString;
  }

  final List<Map<String, dynamic>> healthRisks = [
    {'icon': Icons.warning, 'text': 'High blood pressure'},
    {'icon': Icons.favorite_border, 'text': 'Heart disease'},
    {'icon': Icons.local_hospital, 'text': 'Type 2 diabetes'},
    {'icon': Icons.sports_gymnastics, 'text': 'Joint pain and inflammation'},
    {'icon': Icons.night_shelter, 'text': 'Sleep disorders'},
    {'icon': Icons.mood_bad, 'text': 'Low self-confidence'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkerColor,
      appBar: AppBar(
        backgroundColor: darkerColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text("Result", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Section 1: Your BMI is [value]
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: darkGray,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your BMI is",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE71555),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            healthiness,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      result.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Your BMI result indicates that you're\n $healthiness.\nTry a healthy diet and regular exercise to lose\nweight and feel better.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),

              //  health risks
              SizedBox(height: 24),

              Text(
                "What is Overweight?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8),
              Text(
                "Being overweight means having more body fat than is considered healthy for your height. It's often measured using the Body Mass Index (BMI). A BMI between 25 and 29.9 is considered overweight.",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.warning, color: Colors.amber),
                  Text(
                    "Health Risks of Being Overweight:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: healthRisks.length,
                itemBuilder: (context, index) {
                  final item = healthRisks[index];
                  return ListTile(
                    leading: Icon(item['icon'], color: Colors.amber),
                    title: Text(
                      item['text'],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),

              // Re-calculate button
              SizedBox(height: 16),
              
              
              CustomElevatedButton(
                text: "Re-calculate",
                icon: Icons.refresh,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
              ],
          ),
        ),
      ),
    );
  }
}
