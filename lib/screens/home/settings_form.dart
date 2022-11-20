import 'package:brew_crew/models/MyUser.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final myUser = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(

        //could use provider but here we are using Streambuilder where we listen to userData changes
        stream: DatabaseService(uid: myUser?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Enter name'),
                    validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val ?? ''),
                  ),
                  SizedBox(height: 10.0),
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    activeColor: Colors.brown[_currentStrength ?? 100],
                    inactiveColor: Colors.lightBlue[_currentStrength ?? 100],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) => setState(() => _currentStrength = val.round()),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          await DatabaseService(uid: myUser?.uid).updateUserData(_currentSugars ?? userData.sugars,
                              _currentName ?? userData.name, _currentStrength ?? userData.strength);
                        }
                        if (!mounted) return; 
                        Navigator.pop(context);
                      }),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
