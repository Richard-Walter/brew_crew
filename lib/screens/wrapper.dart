import 'package:brew_crew/models/MyUser.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/logger.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final myUser = Provider.of<MyUser?>(context);   // get MyUser from provider
    
    if (myUser == null) {
      return const Authenticate();
    }

    //if user logged in, go to home page
    return Home();
  }
}
