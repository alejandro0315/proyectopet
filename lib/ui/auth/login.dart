import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetapp/domain/controller/controllerUserFirebase.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //ControlUser controlu = Get.find();
    // ControlNotes controln = Get.find();
    //ControlArticles controla = Get.find();
    //ControlStudent controle = Get.find();
    //ControlPets controlp = Get.find();
    ControlUserAuth controlua = Get.find();
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
             image: AssetImage('assets/images/Loginn.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            // child: const Text(
            //   "Bienvenidos\nProgramacion Movil",
            //   style: TextStyle(color: Colors.white, fontSize: 33),
            // ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [
                TextField(
                  controller: user,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controlua
                            .ingresarUser(user.text, pass.text)
                            .then((value) {
                          if (controlua.userValido == null) {
                            Get.snackbar("Usuarios", controlua.mensajesUser,
                                duration: const Duration(seconds: 4),
                                backgroundColor: Colors.amber);
                          } else {
                            Get.snackbar("Usuarios", controlua.mensajesUser,
                                duration: const Duration(seconds: 4),
                                backgroundColor: Colors.amber);
                            Get.toNamed("/home");
                          }
                        });
                      },
                      child: Center(
                        child: Container(
                          width: 340,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 68, 116, 247),
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/register");
                        },
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Recordar Contraseña',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
