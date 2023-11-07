import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepperStep extends StatefulWidget {
  const StepperStep({super.key});

  @override
  State<StepperStep> createState() => _StepperStepState();
}

class _StepperStepState extends State<StepperStep> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: StepProgressIndicator(
          totalSteps: 3,
          currentStep: 2,
          size: 8,
          padding: 0,
          selectedColor: Colors.blueAccent,
          unselectedColor: Colors.grey,
          roundedEdges: Radius.circular(10),
          // selectedGradientColor: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Colors.yellowAccent, Colors.deepOrange],
          // ),
          // unselectedGradientColor: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Colors.black, Colors.blue],
          // ),
        ),
      ),
    );
  }
}
