import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'BMI Calculator',

debugShowCheckedModeBanner: false,

theme: ThemeData(primarySwatch: Colors.teal),
home: const BMICalculator(),
);


}
}

class BMICalculator extends StatefulWidget {
const BMICalculator({super.key});
@override
State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
double height = 160; // in cm
double weight = 60; // in kg
double? bmi;

String getBMICategory(double bmi) {
if (bmi < 18.5) return "Underweight";
if (bmi < 25) return "Normal";
if (bmi < 30) return "Overweight";
return "Obese";
}

void calculateBMI() {
final hMeters = height / 100;
final result = weight / (hMeters * hMeters);
setState(() => bmi = result);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("BMI Calculator")),
body: Padding(
padding: const EdgeInsets.all(16),
child: Column(
children: [
Text("Height: ${height.toStringAsFixed(1)} cm",
style: const TextStyle(fontSize: 18)),

Slider(
min: 100,
max: 220,
divisions: 120,
value: height,
label: "${height.round()}",
onChanged: (val) => setState(() => height = val),
),


const SizedBox(height: 10),
Text("Weight: ${weight.toStringAsFixed(1)} kg",
style: const TextStyle(fontSize: 18)),

Slider(
min: 30,
max: 150,
divisions: 120,
value: weight,
label: "${weight.round()}",
onChanged: (val) => setState(() => weight = val),
),


const SizedBox(height: 20),
ElevatedButton(
onPressed: calculateBMI,
child: const Text("Calculate BMI"),
),

const SizedBox(height: 30),
if (bmi != null)
Column(
children: [
Text(
"Your BMI is ${bmi!.toStringAsFixed(1)}",
style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),


const SizedBox(height: 8),
Text(
"Category: ${getBMICategory(bmi!)}",
style: const TextStyle(fontSize: 20, color: Colors.redAccent),
)
],
),
],
),
),
);
}
}