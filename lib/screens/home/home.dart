import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/logger.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60), child: SettingsForm());
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () => showSettingsPanel(),
              icon: const Icon(Icons.settings),
              label: const Text('settings'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log out'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const BrewList()),
      ),
    );
  }
}
