import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../domain/controller/controllerControlPets.dart';

class ControlPets extends StatefulWidget {
  const ControlPets({super.key});

  @override
  State<ControlPets> createState() => _ControlPetsState();
}

  final List<String> _options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> _selectedOptions = [];

class _ControlPetsState extends State<ControlPets> {
  AgregarControlPets controlup = Get.find();
  TextEditingController controlSelectmascota = TextEditingController();
  TextEditingController controlFechaCita = TextEditingController();
  TextEditingController controlVeterinaria = TextEditingController();
  TextEditingController controlDetallesCita = TextEditingController();
  TextEditingController controlPeso = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/Logo.png"),
              ),

              radius:
                  20, // ajusta este valor para modificar el tamaño del marco
            ),
            const SizedBox(width: 8),
            const Text('MyPetApp'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/AddControl.png'),
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text('Seleccione mascota'),
              TextField(
                controller: controlSelectmascota,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 4, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Fecha de la cita'),
              TextField(
                controller: controlFechaCita,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 4, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Veterinaria'),
              TextField(
                controller: controlVeterinaria,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 4, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Detalles de la cita'),
             Container(
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: Colors.blue, width: 2),
                ),
           child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
               child: TextFormField(
                 controller: controlDetallesCita,
                   decoration: const InputDecoration(
                    hintText: 'Detalles de la cita',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
        ),
      ),
     const SizedBox(
                height: 15,
              ),
              const Text('Peso'),
              TextField(
                controller: controlPeso,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 4, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 2, color: Colors.blue),
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text("Registrar control"),
                onPressed: () {
                  var catalogo = <String, dynamic>{
                    'selectmascota': controlSelectmascota.text,
                    'fechaCita': controlFechaCita.text,
                    'veterinaria': controlVeterinaria.text,
                    'detallesCita': controlDetallesCita.text,
                    'peso': controlPeso.text,
                  };

                  controlup.crearControlMascota(catalogo);
                  //Peticiones.crearcatalogo(catalogo, _image);

                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
