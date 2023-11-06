import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cleaning_services),
        onPressed: () {
          print("Floating button was pressed.");
          otpController.clear();
          // otpController.set(['2', '3', '5', '5', '7']);
          // otpController.setValue('3', 0);
          // otpController.setFocus(1);
        },
      ),
      body: Center(
        child: circularProgressIndicator(
            centerWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "216g",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF475569)
                    )
                ),
                Text(
                    "Carbs",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF94A3B8)
                    )
                )
              ],
            ),
            height: 100,
            width: 100,
            minValue: 100,
            maxValue: 100,
            progressWidth: 10,
            progressColor: const Color(0xFFFFB2AA),
            progressBackgroundColor: Colors.grey.shade300,
            progressBorderColor: Colors.black),
      ),
    );
  }
}

circularProgressIndicator(
    {required Widget centerWidget,
      required double height,
      required double width,
      required double minValue,
      required double maxValue,
      required double progressWidth,
      required Color progressColor,
      required Color progressBackgroundColor,
      required Color progressBorderColor}) {
  return Container(
    height: height,
    width: width,
    child: CircularPercentIndicator(
      radius: height * 0.5,
      center: centerWidget,
      animateFromLastPercent: true,
      percent: minValue / maxValue > 1 ? 1 : minValue / maxValue,
      progressColor: progressColor,
      animation: true,
      backgroundColor: progressBackgroundColor,
      lineWidth: progressWidth,
    ),
  );
}
