// lib/presentation/screens/doctor_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Hello! Dr. [Doctor's Name]")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Appointment"),
              onTap: () {
                // Navigate to appointments
              },
            ),
            ListTile(
              title: Text("Chat"),
              onTap: () {
                // Navigate to chat
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                // Navigate to settings
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: doctorProvider.logout,
            ),
            SizedBox(height: 20),
            Text("Today's Appointments"),
            SizedBox(height: 10),
            Text("Pending Appointments"),
            ...doctorProvider.pendingAppointments.map((appointment) {
              return ListTile(
                title: Text("${appointment.time} - ${appointment.patientName}"),
                subtitle: Text("Age: ${appointment.patientAge}"),
              );
            }).toList(),
            SizedBox(height: 10),
            Text("Completed Appointments"),
            ...doctorProvider.completedAppointments.map((appointment) {
              return ListTile(
                title: Text("${appointment.time} - ${appointment.patientName}"),
                subtitle: Text("Age: ${appointment.patientAge}"),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
