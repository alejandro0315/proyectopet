import 'package:get/get.dart';
import 'package:mypetapp/data/services/peticionesControlPetsFirebase.dart';

import 'package:mypetapp/data/services/peticionesPetsFirebase.dart';

class AgregarControlPets extends GetxController {
  Future<void> crearControlMascota(Map<String, dynamic> mascota) async {
    await PeticionesControlPet.crearcontrolmascota(mascota);
  }

  Future<void> eliminarMascota(String id) async {
    await PeticionesPet.eliminarmascota(id);
  }

  Future<void> actualizarMascota(
      String id, Map<String, dynamic> mascota) async {
    await PeticionesPet.actualizarmascota(id, mascota);
  }

  Future<void> consultarMascota() async {
    await PeticionesPet.getMyPets();
  }
}