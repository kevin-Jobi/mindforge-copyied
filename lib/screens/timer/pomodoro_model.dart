import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mind_forge/services/models/model.dart';

// class PomodoroModel extends ChangeNotifier {
//   Map<String, SubtopicTimer> _subtopicTimers = {};
//   String _currentSubtopic = '';

//   String get currentSubtopic => _currentSubtopic;

//   int get timeRemaining => _subtopicTimers[_currentSubtopic]?.timeRemaining ?? 1500;
//   bool get isRunning => _subtopicTimers[_currentSubtopic]?.isRunning ?? false;
//   bool isSubtopicCompleted(String subtopic) => _subtopicTimers[subtopic]?.isCompleted ?? false;

//   void setSubtopic(String subtopic) {
//     _currentSubtopic = subtopic;
//     if (!_subtopicTimers.containsKey(subtopic)) {
//       _subtopicTimers[subtopic] = SubtopicTimer();
//       _subtopicTimers[subtopic]!.addListener(notifyListeners);
//     }
//     notifyListeners();
//   }

//   void startPomodoro(BuildContext context) {
//     if (_currentSubtopic.isNotEmpty) {
//       _subtopicTimers[_currentSubtopic]?.startTimer(context, _currentSubtopic);
//     }
//   }

//   void stopPomodoro() {
//     if (_currentSubtopic.isNotEmpty) {
//       _subtopicTimers[_currentSubtopic]?.stopTimer();
//     }
//   }

//   void resetPomodoro(int minutes) {
//     if (_currentSubtopic.isNotEmpty) {
//       _subtopicTimers[_currentSubtopic]?.resetTimer(minutes);
//     }
//   }

//   SubtopicTimer? getSubtopicTimer(String subtopic) {
//     return _subtopicTimers[subtopic];
//   }

//   void markSubtopicCompleted(String subtopic) {
//     if (subtopic.isNotEmpty) {
//       _subtopicTimers[subtopic]?.markCompleted();
//       notifyListeners();
//     }
//   }

  

// }



class PomodoroModel extends ChangeNotifier {
  Map<String, SubtopicTimer> _subtopicTimers = {};
  String _currentSubtopic = '';
  Model? _model;

  String get currentSubtopic => _currentSubtopic;

  int get timeRemaining => _subtopicTimers[_currentSubtopic]?.timeRemaining ?? 1500;
  bool get isRunning => _subtopicTimers[_currentSubtopic]?.isRunning ?? false;
  bool isSubtopicCompleted(String subtopic) => _subtopicTimers[subtopic]?.isCompleted ?? false;

  void setModel(Model model) {
    _model = model;
  }

   void initializeSubtopicTimers(List<String> subtopics) {
    for (String subtopic in subtopics) {
      if (!_subtopicTimers.containsKey(subtopic)) {
        _subtopicTimers[subtopic] = SubtopicTimer();
        _subtopicTimers[subtopic]!.addListener(notifyListeners);
      }
    }
  }

  void setSubtopic(String subtopic) {
    _currentSubtopic = subtopic;
    if (!_subtopicTimers.containsKey(subtopic)) {
      _subtopicTimers[subtopic] = SubtopicTimer();
      _subtopicTimers[subtopic]!.addListener(notifyListeners);
    }
    notifyListeners();
  }

  void startPomodoro(BuildContext context) {
    if (_currentSubtopic.isNotEmpty) {
      _subtopicTimers[_currentSubtopic]?.startTimer(context, _currentSubtopic,this);
    }
  }

  void stopPomodoro() {
    if (_currentSubtopic.isNotEmpty) {
      _subtopicTimers[_currentSubtopic]?.stopTimer();
    }
  }

  void resetPomodoro(int minutes) {
    if (_currentSubtopic.isNotEmpty) {
      _subtopicTimers[_currentSubtopic]?.resetTimer(minutes);
    }
  }

  SubtopicTimer? getSubtopicTimer(String subtopic) {
    return _subtopicTimers[subtopic];
  }

  void markSubtopicCompleted(String subtopic) {
    if (subtopic.isNotEmpty) {
      _subtopicTimers[subtopic]?.markCompleted();
      updateSubtopicCheckedStatus(subtopic, true);
      notifyListeners();
    }
  }

  // void updateSubtopicCheckedStatus(String subtopic, bool isChecked) {
  //   _model?.subtopicChecked[_model!.subtopic.indexOf(subtopic)] = isChecked;
  //   _model?.save();
  //   notifyListeners();
  // }

    void updateSubtopicCheckedStatus(String subtopic, bool isChecked) {
    if (_model != null) {
      int index = _model!.subtopic.indexOf(subtopic);
      if (index != -1) {
        _model!.subtopicChecked[index] = isChecked;
        _model!.save();
        notifyListeners();
      }
    }
  }

}

// class SubtopicTimer extends ChangeNotifier {
//   int _timeRemaining = 1500;
//   bool _isRunning = false;
//   bool _isCompleted = false;
//   Timer? _timer;

//   int get timeRemaining => _timeRemaining;
//   bool get isRunning => _isRunning;
//   bool get isCompleted => _isCompleted;

//   void startTimer(BuildContext context, String subtopic) {
//     if (!_isRunning) {
//       _isRunning = true;
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (_timeRemaining > 0) {
//           _timeRemaining--;
//           notifyListeners();
//         } else {
//           stopTimer();
//           showCompletionDialog(context, subtopic);
//         }
//       });
//       notifyListeners();
//     }
//   }

//   void stopTimer() {
//     _isRunning = false;
//     _timer?.cancel();
//     notifyListeners();
//   }

//   void resetTimer(int minutes) {
//     stopTimer();
//     _timeRemaining = minutes * 60;
//     _isCompleted = false;
//     notifyListeners();
//   }

//   void markCompleted() {
//     _isCompleted = true;
//     notifyListeners();
//   }

//   // ... (keep the showCompletionDialog method as it is)




// void showCompletionDialog(BuildContext context, String subtopic) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(

//         title: Text('Timer Finished'),
//         content: Text('Did you cover it properly?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               markCompleted();
//               context.read<PomodoroModel>().markSubtopicCompleted(subtopic);  // Mark the subtopic as completed
//               Navigator.of(context).pop();  // Close the dialog
//             },
//             child: Text('Yes'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();  // Close the dialog without any action
//             },
//             child: Text('No'),
//           ),
//         ], 
//       );
//     },
//   );
// }

// }



class SubtopicTimer extends ChangeNotifier {
  int _timeRemaining = 1500;
  bool _isRunning = false;
  bool _isCompleted = false;
  Timer? _timer;

  int get timeRemaining => _timeRemaining;
  bool get isRunning => _isRunning;
  bool get isCompleted => _isCompleted;

  void startTimer(BuildContext context, String subtopic, PomodoroModel pomodoroModel) {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_timeRemaining > 0) {
          _timeRemaining--;
          notifyListeners();
        } else {
          stopTimer();
          showCompletionDialog(context, subtopic, pomodoroModel);
        }
      });
      notifyListeners();
    }
  }

  void stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer(int minutes) {
    stopTimer();
    _timeRemaining = minutes * 60;
    _isCompleted = false;
    notifyListeners();
  }

  void markCompleted() {
    _isCompleted = true;
    notifyListeners();
  }

  void showCompletionDialog(BuildContext context, String subtopic, PomodoroModel pomodoroModel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Timer Finished'),
        content: Text('Did you cover it properly?'),
        actions: [
          TextButton(
            onPressed: () {
              pomodoroModel.markSubtopicCompleted(subtopic);
              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
}










