import 'package:flutter/material.dart';
import 'package:examen1_ahas/utils/constant.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  ///Cargar o actualizar las varibles o estados antes de visualizar o craer la vista
  @override
  void initState() {
    lista = List.from(con.listaExamen); ///Copia de una lista inmutable a una lista mutable o cambiante
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd4e6f1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF154360),
        title: const Text('Angel Salomon Antonio Hernández'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Titulo(size: size),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final itemData = lista[index].split('#');
                  final id = int.parse(itemData[0]);
                  final edad = itemData[1];
                  final dia = itemData[2];
                  final mes = itemData[3];
                  final nombre = itemData[4];
                  final apellidos = itemData[5];
                  final descripcion = itemData[6];
                  final estrellas = int.parse(itemData[7]);

                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: size.height * 0.25,
                    width: size.width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Contenedor del contenido principal
                        GestureDetector(
                          onTap: () {
                            showSnackBar(
                                'ID: $id\n'
                                    'Edad: $edad\n'
                                    'Fecha: $dia de $mes\n'
                                    'Nombre: $nombre $apellidos\n'
                                    'Descripción: $descripcion\n'
                                    'Estrellas: $estrellas', 5);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: size.height * 0.2,
                            width: id == 1 || id == 10 ? size.width * 0.87 : size.width * 0.5,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Primera fila: Día, mes, e ícono
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('$dia de $mes'),
                                    Icon(
                                      (id == 1 || id == 5 || id == 10)
                                          ? Icons.check
                                          : Icons.energy_savings_leaf,
                                      color: (id == 1 || id == 5 || id == 10)
                                          ? Colors.yellow
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                                // Segunda fila: Nombre completo
                                Text(
                                  '$nombre $apellidos',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                // Tercera fila: Descripción
                                Text(
                                  descripcion,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                // Cuarta fila: Estrellas
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: List.generate(5, (i) {
                                    return Icon(
                                      i < estrellas
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: i < estrellas
                                          ? Colors.yellow
                                          : Colors.grey,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Contenedor del botón de eliminar
                        if (id != 1 && id != 10)
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            height: size.height * 0.2,
                            width: size.width * 0.36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                showSnackBar('Eliminando ID: $id', 2);
                                setState(() {
                                  lista.removeAt(index);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 40),
                                backgroundColor: Colors.red, // Color de fondo del botón
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Espaciado interno del botón
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Bordes redondeados del botón
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10), // Espacio entre ícono y texto
                                  Text(
                                    'Borrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showSnackBar(String texto, int duracion){
    final snack = SnackBar(
      content: Text(texto,
          style: const TextStyle(
            color: con.efectos,
          )
      ),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {
          //Cualquier acción al dar clic sobre el widget
        },
        label: 'Cerrar',
      ),
    );

    ///Muestra el mensaje en pantalla
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}

class Titulo extends StatelessWidget {
  const Titulo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: size.height * 0.08,
      width: size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Redondea los bordes
        border: Border.all(
          color: Colors.black, // Color del borde
          width: 2, // Ancho del borde
        ),
      ),
      child: const Text(
        'Calendario de Cumpleaños',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF154360),
        ),
      ),
    );
  }
}