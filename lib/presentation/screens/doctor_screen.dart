// lib/presentation/screens/doctor_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sapdos_app/core/constants/colors.dart';
import 'package:sapdos_app/presentation/providers/auth_provider.dart';
import '../providers/doctor_provider.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Hello! Dr. ${authprovider.getName()}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
      drawer: Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35.0),
                topRight: Radius.circular(35.0))),
        height: double.infinity,
        width: 200,
        child: const Column(
          children: [
            Center(
              child: Text(
                "SAPDOS",
                style: TextStyle(
                    fontSize: 28, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.category,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Category",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Appointment",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Chat",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ListTile(
            //   title: Text("Appointment"),
            //   onTap: () {
            //     // Navigate to appointments
            //   },
            // ),
            // ListTile(
            //   title: Text("Chat"),
            //   onTap: () {
            //     // Navigate to chat
            //   },
            // ),
            // ListTile(
            //   title: Text("Settings"),
            //   onTap: () {
            //     // Navigate to settings
            //   },
            // ),
            // ListTile(
            //   title: Text("Logout"),
            //   onTap: doctorProvider.logout,
            // ),
            // SizedBox(height: 20),
            const Text(
              "Today's Appointments",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Pending Appointments"),
            ...doctorProvider.pendingAppointments.map((appointment) {
              return ListTile(
                title: Text("${appointment.time} - ${appointment.patientName}"),
                subtitle: Text("Age: ${appointment.patientAge}"),
              );
            }).toList(),
            const SizedBox(height: 10),
            const Text("Completed Appointments"),
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
