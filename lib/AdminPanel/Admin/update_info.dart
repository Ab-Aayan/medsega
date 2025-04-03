import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key, required this.appointmentKey})
      : super(key: key);

  final String appointmentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  final userstatusController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('appointments');
    getappointmentData();
  }

  void getappointmentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.appointmentKey).get();

    Map appointment = snapshot.value as Map;

    userstatusController.text = appointment['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userstatusController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Approved',
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'status': userstatusController.text,
                  };

                  dbRef
                      .child(widget.appointmentKey)
                      .update(students)
                      .then((value) => {Navigator.pop(context)});
                },
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
                child: const Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
