import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class PeticionesPet {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> crearmascota(Map<String, dynamic> pets, foto) async {
    print(pets['foto']);

    var url = '';
    if (foto != null) {
      url = await PeticionesPet.cargarfoto(foto, pets['nombre']);
    }
    print(url);
    pets['foto'] = url.toString();

    await _db.collection('pets').doc().set(pets).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("pets");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();
    print('url:' + url.toString());
    return url.toString();
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
