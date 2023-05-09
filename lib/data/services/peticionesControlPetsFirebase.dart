import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class PeticionesControlPet {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> crearcontrolmascota(Map<String, dynamic> pets) async {
    await _db.collection('controlpets').doc().set(pets).catchError((e) {
      print(e);
    });
    //return true;
  }


  static Future<void> actualizarmascota(
      String id, Map<String, dynamic> pets) async {
    await _db.collection('mascotaTI').doc(id).update(pets).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarmascota(String id) async {
    await _db.collection('mascotaTI').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<List<QueryDocumentSnapshot>> getMyPets() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      // El usuario no ha iniciado sesión
      return [];
    }

    final QuerySnapshot querySnapshot = await _db
        .collection('pets')
        .where('ownerId', isEqualTo: user.uid)
        .get();

    return querySnapshot.docs;
  }
}
