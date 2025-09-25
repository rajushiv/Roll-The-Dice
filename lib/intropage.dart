import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Named routes
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}

// ---------------- FIRST SCREEN ----------------
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Details',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              // Weight
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  labelText: 'Enter Weight (kg)',
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              // Height feet
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  labelText: 'Enter Height (ft)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              // Height inches
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  labelText: 'Enter Height (inch)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.trim();
                  var ft = ftController.text.trim();
                  var inch = inController.text.trim();

                  if (wt != "" && ft != "" && inch != "") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    // total inches
                    var totalInch = (iFt * 12) + iInch;

                    // convert to meters
                    var heightMeter = totalInch * 0.0254;

                    // calculate BMI
                    var bmi = iWt / (heightMeter * heightMeter);

                    String msg;
                    if (bmi < 18.5) {
                      msg = "You are Underweight 😔";
                    } else if (bmi >= 18.5 && bmi <= 24.9) {
                      msg = "You are Healthy 💪";
                    } else if (bmi >= 25 && bmi <= 29.9) {
                      msg = "You are Overweight 😟";
                    } else {
                      msg = "You are Obese ⚠️";
                    }

                    // navigate to second screen with result
                    Navigator.pushNamed(
                      context,
                      '/second',
                      arguments:
                      "Your BMI is ${bmi.toStringAsFixed(2)}\n$msg",
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("⚠️ Please fill all the fields!"),
                      ),
                    );
                  }
                },
                child: const Text("Calculate BMI"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- SECOND SCREEN ----------------
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // receive arguments from first screen
    final result = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Result")),
      body: Center(
        child: Text(
          result ?? "No Data Found",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
