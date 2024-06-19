import 'package:flutter/material.dart';

class Appointment {
  final String time;
  final String patientName;
  final int patientAge;

  Appointment(this.time, this.patientName, this.patientAge);
}

class DoctorProvider with ChangeNotifier {
  String _doctorName = '';
  String get doctorName => _doctorName;

  setDoctorName(String name) {
    _doctorName = name;
    notifyListeners();
  }

  List<Appointment> _pendingAppointments = [
    Appointment("9:00 AM", "John Doe", 25),
  ];

  List<Appointment> _completedAppointments = [
    Appointment("8:00 AM", "Jane Smith", 30),
  ];

  List<Appointment> get pendingAppointments => _pendingAppointments;
  List<Appointment> get completedAppointments => _completedAppointments;

  void logout() {}
}
