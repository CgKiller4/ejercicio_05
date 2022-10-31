import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
  
}

// ignore: non_constant_identifier_names
String Convertidor(int numero, int base)
{
  if (numero < base){
    return numero.toString();
  }
  else
  {
    int division = numero ~/base;
    int modulo = (numero%base).toInt();
    
    if(division == 0)
    {
      return modulo.toString();
    }
    else
    {
      return Convertidor(division, base).toString()+modulo.toString();
    }
  } 
}

// ignore: non_constant_identifier_names
TextEditingController TxtNumero = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController TxtBase = TextEditingController();
// ignore: non_constant_identifier_names
String TxtNumerores = "";


class _HomeState extends State<Home> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Numeros con base")), 
      ),
      body: cuerpo(), 
    );
  }
}

Widget cuerpo(){
  return Center(
    child: Column(
      children: <Widget>[
        encabezado(),
        campoNumero(),
        campoBase(),
        botonEntrar(), 
        resultado()
      ],
  ),);
}
Widget encabezado(){
  return const Text("Convertidor de base", style: TextStyle(color: Colors.black, fontSize: 35.0),);
}

Widget campoNumero(){
  return TextField(
    controller: TxtNumero,
    // ignore: prefer_const_constructors
    decoration: InputDecoration(
      hintText: "Ingrese el numero a convertir: "
    ),
  );
}

Widget campoBase(){
  return TextField(
    controller: TxtBase,
    decoration: const InputDecoration(
      hintText: "A que base lo desea convertir: "
    ),
  );
}
Widget botonEntrar() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 255, 254, 254), backgroundColor: const Color.fromARGB(255, 18, 131, 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      onPressed: () 
      {
        int nume = int.parse(TxtNumero.text);
        int bass = int.parse(TxtBase.text);
        TxtNumerores = Convertidor(nume, bass);
        print(TxtNumerores);
        
      },
      child: const Text("Convertir"));
}

Widget resultado(){
  return  Text(" El resultado es: $TxtNumerores", style: const TextStyle(color: Colors.black, fontSize: 35.0),);
}