import 'dart:developer';

import 'package:brew_crew/logger.dart';
import 'package:brew_crew/models/MyUser.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      print('line 25');
      logger.d(doc.data().toString());
      return Brew(name: doc.get('name') ?? '', sugars: doc.get('sugars') ?? '', strength: doc.get('strength') ?? 0);
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot docSnapshot) {
    print('line 32');

    UserData userData = UserData(
        uid: uid!,
        name: docSnapshot.get('name'),
        sugars: docSnapshot.get('sugars'),
        strength: docSnapshot.get('strength')
    );

    print(docSnapshot.data().toString());

    return userData;
  }

  //notify any doc changes in the root database.
  Stream<List<Brew>> get brews {
    // return _brewListFromSnapshot(brewCollection.snapshots());
    return brewCollection.snapshots().map((snapShot) => _brewListFromSnapshot(snapShot));
  }

  //notify when user brew doc changes
  Stream<UserData> get userData {
    // return brewCollection.snapshots().map((snapShot) => _brewListFromSnapshot(snapShot));
    return brewCollection.doc(uid).snapshots().map((snapShot) => _userDataFromSnapshot(snapShot));
  }
}
