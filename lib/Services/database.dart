import 'package:brew_crew/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseSerive {
  final String uid;
  DatabaseSerive({required this.uid});
  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //Brew List from snapshot
  List<Brew>_brewListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc)
    {
      return Brew(name: doc.get('name') ?? '', sugars:doc.get('sugars')??'' , strength:doc.get('strength') ?? 0);
      // ?? is used for 'if doesnt exists'
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
