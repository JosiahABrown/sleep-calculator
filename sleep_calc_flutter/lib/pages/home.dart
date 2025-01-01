import 'package:flutter/material.dart'; 
import 'utils/time_calculations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DateTime> _calculatedTimes = [];

  Future<DateTime> _openTimePicker(BuildContext context, String title, bool isBedTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.dark(),
              ),
              child: child!,
            ),
          ],
        );
      },
    );

    if (pickedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      
      List<DateTime> calculatedTimes;
      if (isBedTime) {
        calculatedTimes = TimeCalc.calculateWakeUpTimes(selectedDateTime);
        print("Wake-up times: $calculatedTimes");
      } else {
        calculatedTimes = TimeCalc.calculateBedTimes(selectedDateTime);
        print("Bed times: $calculatedTimes");
      }

      setState(() {
        _calculatedTimes = calculatedTimes;
      });

      return selectedDateTime;
    } else {
      return DateTime.now();
    }
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Sleep Calculator',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 200;

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_calculatedTimes.isNotEmpty)
              Text(
                'Calculated Times:',
                style: TextStyle(fontSize: 20),
              ),
            if (_calculatedTimes.isNotEmpty)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: _calculatedTimes.length,
                    itemBuilder: (context, index) { 
                      DateTime times = _calculatedTimes[index];
                      int sleepCycles = index + 4;
                      String recommnded = (sleepCycles == 5) ? "Recommended" : "";
                      return Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text('$sleepCycles Sleep Cycles: ${times.toLocal().toString().substring(11, 16)} $recommnded'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () async {
                  await _openTimePicker(context, 'Select Bed Time', true);
                },
                child: Row(
                  children: [
                    Icon(Icons.timer),
                    Text(' Set Bed Time')
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
              onPressed: () async {
                await _openTimePicker(context, 'Select Wake Up Time', false);
              },
              child: Row(
                children: [
                  Icon(Icons.timer), 
                  Text(' Set Wake Up Time'),
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}