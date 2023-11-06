import 'package:flutter/material.dart';

class TimeRange extends StatefulWidget {
  const TimeRange({super.key});

  @override
  State<TimeRange> createState() => _TimeRangeState();
}

class _TimeRangeState extends State<TimeRange> {
  TimeOfDay initialTime = TimeOfDay.now();
  TimeOfDay finalTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context, bool isInitial) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isInitial ? initialTime : finalTime,
    );
    if (pickedTime != null &&
        pickedTime != (isInitial ? initialTime : finalTime)) {
      setState(() {
        if (isInitial)
          initialTime = pickedTime;
        else
          finalTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'When do you want to receive your Hibiscus tip?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _selectTime(context, true);
                  },
                  child: Container(
                    height: 50,
                    width: 110,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${initialTime.hour > 12 ? "${initialTime.hour - 12}" : initialTime.hour} ${initialTime.hour > 11 ? "PM" : "AM"}"),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          weight: 48,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                // timeSelector(),
                Text('to'),
                // timeSelector(),
                InkWell(
                  onTap: () {
                    _selectTime(context, false);
                  },
                  child: Container(
                    height: 50,
                    width: 110,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${finalTime.hour > 12 ? "${finalTime.hour - 12}" : finalTime.hour} ${finalTime.hour > 11 ? "PM" : "AM"}"),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          weight: 48,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class timeSelector extends StatelessWidget {
  const timeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButtonFormField<String>(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          weight: 48,
          size: 30,
        ),
        items: <String>[
          '4 am',
          '5 am',
          '6 am',
          '7 am',
          '8 am',
          '9 am',
          '10 am',
          '11 am',
          '12 pm',
          '1 pm',
          '2 pm',
          '3 pm',
          '4 pm',
          '5 pm',
          '6 pm',
          '7 pm',
          '8 pm',
          '9 pm',
          '10 pm',
          '11 pm'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
        ),
        onChanged: (_) {},
      ),
    );
  }
}
