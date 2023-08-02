import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightAltura = 160;
  double weightPesoSlider = 85.7;
  //double bmiResultado = 0;//////////////////////////////////////////////////////////////////////

  //                                  String resultadoValue = "";
  //                                String recomendacion = "";
  double porBajaroSubir = 0;

  //                              String respuestaGeneral = "";

  //int imagenNumero = 1;

  //                          void calculate() {
  //                           bmiResultado = (weightPesoSlider / (heightAltura * heightAltura)) * 10000;
  //                           print(bmiResultado);
  //                           double xBajar = 0;
  //                           double porBajaroSubirsobrepeso = 0;
//
  //                                    if (bmiResultado <= 18.5) {
  //                                    double xSubir;
  //                                  resultadoValue = "Peso Bajo";
  //                                recomendacion = "Necesitas Alimentarte Mejor";
  //                              xSubir = 18.5 - bmiResultado;
  //                            porBajaroSubir = xSubir;
  //                          respuestaGeneral =
  //                            "Debes Subir ${porBajaroSubir.toStringAsFixed(2)} kilos para alcanzar un ICM Normal";
  //                      imagenNumero = 2;
  //                  } else if (bmiResultado >= 18.6 && bmiResultado <= 25.0) {
  //                  resultadoValue = "Peso Normal";
  //                recomendacion =
  //                  "Estas en Optimas condiciones, Manten tu ritmo, estas con un ICM Normal";
  //                                       respuestaGeneral = "Manten este Ritmo";
  //                                     imagenNumero = 1;
  //                                 } else {
  //                                 resultadoValue = "Sobre peso";
  //                               recomendacion = "Debes comer mas Saludable y evita Grasas";
  //                             xBajar = 25.0 - bmiResultado;
  //                           porBajaroSubir = xBajar;
  //                         respuestaGeneral =
  //                           "Debes Bajar ${porBajaroSubir.toStringAsFixed(2)} Kilos para alcanzar un ICM Normal";
  //                     imagenNumero = 4;
  //                 }
  //               ;
//
  //                                    setState(() {});
  //                                }

  double calcularBmi() {
    return weightPesoSlider / pow((heightAltura * 0.01), 2);
  }

//get significa OBTENER O CONSEGUIR
  String getResultado() {
    //bajo peso, norma y sobre peso

    double bmi = calcularBmi();
    String result = "";

    if (bmi < 18.5) {
      result = "Bajo Peso";
    } else if (bmi < 25) {
      result = "Peso Normal";
    } else {
      result = "Sobre Peso";
    }

    return result;
  }

  String getRecomendacion() {
    //bajo peso, norma y sobre peso

    double bmi = calcularBmi();
    String result = "";

    if (bmi < 18.5) {
      result = "Debes de Comer mas sano y hacer mas Ejercicio.";
    } else if (bmi < 25) {
      result = "Todo esta muy bien, sigue ese ritmo";
    } else {
      result =
          "Debes de Comer mas Saludable y hacer ejercicios minimo 5 horas Diarias.";
    }

    return result;
  }

  int getImage() {
    double bmi = calcularBmi();
    int resultado = 0;

    if (bmi < 18.5) {
      resultado = 2;
    } else if (bmi < 25) {
      resultado = 3;
    } else {
      resultado = 4;
    }

    return resultado;
  }

  double getdifernciaKilos() {
    double diferencia = 0;

    diferencia = porBajaroSubir * pow((heightAltura * 0.01), 2);

    return diferencia;
  }

  String getPesoxModificar() {
    double bmi = calcularBmi();
    double difereciaBmi = 0;
    String respuestageneral = "";

    if (bmi < 18.5) {
      difereciaBmi = (bmi - 18.5) * -1;
      respuestageneral =
          "Tienes una subir unos ${getdifernciaKilos().toStringAsFixed(2)} kilos, para ingresar al IMC Normal.";
    } else if (bmi < 25) {
      respuestageneral = "Sigue asi y Manten tu Ritmo.";
    } else {
      difereciaBmi = bmi - 25;
      respuestageneral =
          "Tienes que bajar unos ${getdifernciaKilos().toStringAsFixed(2)} kilos, para Ingresar al IMC normal";
    }

    porBajaroSubir = difereciaBmi;
    return respuestageneral;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calcular Indice Muscular",
        ),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text("Altura: "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  //heightAltura.toInt().toString(),
                  heightAltura.toStringAsFixed(1),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                Text(
                  " cm",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Slider(
                value: heightAltura,
                min: 50,
                max: 230,
                onChanged: (double mandarina) {
                  heightAltura = mandarina;

                  setState(() {});
                }),
            const Text("Peso: "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  //heightAltura.toInt().toString(),
                  weightPesoSlider.toStringAsFixed(1),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                Text(
                  " Kg",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Slider(
                value: weightPesoSlider,
                min: 0,
                max: 130,
                onChanged: (double mandarina) {
                  weightPesoSlider = mandarina;

                  setState(() {});
                }),
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ;
                },
                child: Text("Calcular IBM"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Text(
                      calcularBmi().toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 39.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      getResultado(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      getRecomendacion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      getPesoxModificar(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          //color: Colors.black45,
                          //color: porBajaroSubir<=18.5?: Color(regb) ,

                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/imagenes/imagen${getImage()}.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
