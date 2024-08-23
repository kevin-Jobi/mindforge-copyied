import 'package:flutter/material.dart';
import 'package:mind_forge/screens/timer/pomodoro_model.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Pomodoro Timer"),
        backgroundColor: Colors.green[800],
      ),
      body: Consumer<PomodoroModel>(
        builder: (context, pomodoroModel, child) {
          var subtopicTimer = pomodoroModel.currentSubtopic.isNotEmpty
              ? pomodoroModel.getSubtopicTimer(pomodoroModel.currentSubtopic)
              : null;

          return subtopicTimer != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Current Subtopic: ${pomodoroModel.currentSubtopic}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => TimerSelectionBottomSheet(),
                        );
                      },
                      child: Text(
                        '${(subtopicTimer.timeRemaining ~/ 60).toString().padLeft(2, '0')}:${(subtopicTimer.timeRemaining % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: subtopicTimer.isRunning
                              ? pomodoroModel.stopPomodoro
                              : () => pomodoroModel.startPomodoro(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: subtopicTimer.isRunning
                                ? Colors.red
                                : Colors.green[800],
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Icon(
                            subtopicTimer.isRunning
                                ? Icons.pause_circle
                                : Icons.play_circle,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: subtopicTimer.isRunning
                              ? null
                              : () => pomodoroModel.resetPomodoro(25),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: subtopicTimer.isRunning
                                ? Colors.grey
                                : Colors.orange[800],
                          ),
                          child: Text('Reset Timer'),
                        )
                      ],
                    ),
                  ],
                )
              : Center(
                  child: Text('No Subtopic Selected'),
                );
        },
      ),
    );
  }
}


class TimerSelectionBottomSheet extends StatefulWidget {
  @override
  _TimerSelectionBottomSheetState createState() => _TimerSelectionBottomSheetState();
}

class _TimerSelectionBottomSheetState extends State<TimerSelectionBottomSheet> {
  int selectedTime = 25; // Default selected time

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select Pomodoro Duration",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
          ),
          SizedBox(height: 20),

          // Horizontal Scrolling Time Picker
          Container(
            height: 80, // Height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 21, // 10 to 110 minutes (increments of 5)
              itemBuilder: (context, index) {
                int timeValue = 1 + index * 5;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = timeValue;
                    });

                    // Update the selected time in the Pomodoro model
                    context.read<PomodoroModel>().resetPomodoro(selectedTime);

                    // Close the bottom sheet after selection
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70, // Width for each time selection box
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedTime == timeValue
                          ? Colors.green[800]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '$timeValue',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: selectedTime == timeValue
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
