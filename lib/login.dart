import 'package:flutter/material.dart';
import 'package:examen1_ahas/home.dart';
import 'package:examen1_ahas/utils/constant.dart' as con;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///Variables para capturar el valor de los inputs del usuario
  TextEditingController user = TextEditingController();
  final pass = TextEditingController(); ///Otorga a la var el tipo que recibe
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: con.fondo2,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo),
                    ContFondo(size: size, color: con.fondo2),
                    ContFondo(size: size, color: con.fondo3),
                    ContFondo(size: size, color: con.fondo4),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo4),
                    ContFondo(size: size, color: con.fondo3),
                    ContFondo(size: size, color: con.fondo),
                    ContFondo(size: size, color: con.fondo2),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo3),
                    ContFondo(size: size, color: con.fondo4),
                    ContFondo(size: size, color: con.fondo2),
                    ContFondo(size: size, color: con.fondo),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo2),
                    ContFondo(size: size, color: con.fondo),
                    ContFondo(size: size, color: con.fondo4),
                    ContFondo(size: size, color: con.fondo3),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo),
                    ContFondo(size: size, color: con.fondo2),
                    ContFondo(size: size, color: con.fondo3),
                    ContFondo(size: size, color: con.fondo4),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ContFondo(size: size, color: con.fondo4),
                    ContFondo(size: size, color: con.fondo3),
                    ContFondo(size: size, color: con.fondo),
                    ContFondo(size: size, color: con.fondo2),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Container(
            padding: const EdgeInsets.all(25.0),
            height: size.height * 0.6,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20), // Redondea los bordes
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bienvenido a tu PRIMER EXAMEN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: con.titulos,
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Ingresa tu correo electrónico:',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
                TextFormField(
                  controller: user,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Correo',
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Ingresa tu contraseña:',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Contraseña',
                  ),
                ),
                const SizedBox(height: 20,),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Color(0xff919b02), fontSize: 15),
                    ),
                  ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if (user.text.isEmpty || pass.text.isEmpty) {
                        errorMessage = 'Datos incompletos';
                      } else if (user.text != 'test@correo.mx' && pass.text != 'FDM2') {
                        errorMessage = 'Usuario y contraseña incorrectos';
                      } else if (user.text != 'test@correo.mx') {
                        errorMessage = 'Usuario incorrecto';
                      } else if (pass.text != 'FDM2') {
                        errorMessage = 'Contraseña incorrecta';
                      } else {
                        errorMessage = null;
                        ///showSnackBar('Ingreso Correctamente', 10);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const Home()));
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    backgroundColor: con.botones, // Color de fondo del botón
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Espaciado interno del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Bordes redondeados del botón
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Mi primer examen, ¿estará sencillo?',
                  style: TextStyle(color: Colors.white,),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}

class ContFondo extends StatelessWidget {
  final Color color;
  final Size size;
  const ContFondo({
    super.key,
    required, required this.color, required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.165,
      width: size.width * 0.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40), // Redondea los bordes
      ),
    );
  }
}

void showSnackBar (String texto, int duracion) {
  SnackBar(
    content: Text(
      texto,
      style: const TextStyle(color: con.efectos,),
    ),
    duration: Duration(seconds: duracion),
    action: SnackBarAction(
      onPressed: (){
        ///Cualquier acción al dar clic
      },
      label: 'Cerrar',
    ),
  );
}