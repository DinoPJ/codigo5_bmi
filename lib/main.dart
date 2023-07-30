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
  double pesoSlider = 0;
  double imcResultado = 0;
  String resultadoValue = "";
  String recomendacion = "";
  double porBajaroSubir = 0;

  String respuestaGeneral = "";

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
                max: 250,
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
                  pesoSlider.toStringAsFixed(1),
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
                value: pesoSlider,
                min: 0,
                max: 200,
                onChanged: (double mandarina) {
                  pesoSlider = mandarina;
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
                  imcResultado =
                      (pesoSlider / (heightAltura * heightAltura)) * 10000;
                  print(imcResultado);
                  double xBajar = 0;
                  double porBajaroSubirsobrepeso = 0;

                  if (imcResultado <= 18.5) {
                    double xSubir;
                    resultadoValue = "Peso Bajo";
                    recomendacion = "Necesitas Alimentarte Mejor";
                    xSubir = 18.5 - imcResultado;
                    porBajaroSubir = xSubir;
                    respuestaGeneral =
                        "Debes Subir ${porBajaroSubir.toStringAsFixed(2)} kilos para alcanzar un ICM Normal";
                  } else if (imcResultado >= 18.6 && imcResultado <= 25.0) {
                    resultadoValue = "Peso Normal";
                    recomendacion =
                        "Estas en Optimas condiciones, Manten tu ritmo, estas con un ICM Normal";
                    respuestaGeneral = "Manten este Ritmo";
                  } else
                    (
                      resultadoValue = "Sobre peso",
                      recomendacion =
                          "Debes comer mas Saludable y evita Grasas",
                      xBajar = 25.0 - imcResultado,
                      porBajaroSubir = xBajar,
                      respuestaGeneral =
                          "Debes Bajar ${porBajaroSubir.toStringAsFixed(2)} Kilos para alcanzar un ICM Normal",
                    );

                  setState(() {});
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
                      imcResultado.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 39.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      resultadoValue,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      recomendacion,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      respuestaGeneral,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          //color: Colors.black45,
                          //color: porBajaroSubir<=18.5?: Color(regb) ,

                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/imagen1.png",
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
