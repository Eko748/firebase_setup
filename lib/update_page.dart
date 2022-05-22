import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_setup/model/user.dart';


class UpdatePage extends StatefulWidget {
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final controllerNama = TextEditingController();
  final controllerUmur = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Update User'),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        TextField(
          controller: controllerNama,
          decoration: decoration('Nama'),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controllerUmur,
          decoration: decoration('Umur'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        DateTimeField(
          controller: controllerDate,
          decoration: decoration('Birthday'),
          format: DateFormat('yyyy-MM-dd'),
          onShowPicker: (context, currentValue) => showDatePicker( 
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            initialDate: currentValue ?? DateTime.now(),
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          child: const Text('Update'),
          onPressed: () {
            final user = User(
              nama: controllerNama.text,
              age: int.parse(controllerUmur.text),
              birthday: DateTime.parse(controllerDate.text),
            );

            updateUser(user);

            Navigator.pop(context);
          },
        )
      ],
    ),
  );

  InputDecoration decoration(String label) => InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
  );
    
  Future updateUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.update(json);
  }
}