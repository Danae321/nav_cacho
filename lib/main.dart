import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navegación con Navigator',
    home: MainScreen(),
  ));
}

// Pantalla principal donde ingresas la cantidad de tableros
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla Principal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Escribe la cantidad de tableros de Cacho:",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Cantidad de Tableros',
                  errorText: _errorText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final input = _controller.text;
                final int? cantidadTableros = int.tryParse(input);

                if (cantidadTableros == null || cantidadTableros <= 0) {
                  // Mostrar error si no es un número válido
                  setState(() {
                    _errorText = 'Por favor, ingresa un número válido.';
                  });
                } else {
                  // Limpiar error y navegar a la segunda pantalla
                  setState(() {
                    _errorText = null;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(cantidadTableros: cantidadTableros),
                    ),
                  );
                }
              },
              child: const Text("Ir a la Segunda Pantalla"),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla secundaria donde se muestran los tableros en una cuadrícula
class SecondScreen extends StatelessWidget {
  final int cantidadTableros;

  const SecondScreen({Key? key, required this.cantidadTableros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Pantalla: $cantidadTableros Tableros"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tableros por fila
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cantidadTableros,
        itemBuilder: (context, index) {
          return CachoBoard(); // Un tablero de Cacho
        },
      ),
    );
  }
}

// Widget de un tablero de Cacho
class CachoBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Cacho(), // Aquí llamamos al widget del juego Cacho
      ),
    );
  }
}

// Aquí va tu lógica del juego de Cacho, que ya deberías tener implementada
class Cacho extends StatefulWidget {
  const Cacho({super.key});

  @override
  State<Cacho> createState() => _CachoState();
}

class _CachoState extends State<Cacho> {
  int button1Value = 0;
  int button2Value = 0;
  int button3Value = 0;
  int button4Value = 0;
  int button5Value = 0;
  int button6Value = 0;
  int button7Value = 0;
  int button8Value = 0;
  int button9Value = 0;
  int button10Value = 0;
  int button11Value = 0;
  int button12Value = 0; 

  //ESTADOS
  bool isButton1Clicked = false;
  bool isButton2Clicked = false;
  bool isButton3Clicked = false;
  bool isButton4Clicked = false;
  bool isButton5Clicked = false;
  bool isButton6Clicked = false;
  bool isButton7Clicked = false;
  bool isButton8Clicked = false;
  bool isButton9Clicked = false;
  bool isButton10Clicked = false;

  void buttonPressed(int buttonIndex) {
    setState(() {
      switch (buttonIndex) {
        case 1:
          button1Value = (button1Value + 1) % 6;
          if (!isButton1Clicked) {
            button11Value++;
            isButton1Clicked = true;
          }
          break;
        case 2:
          if (button2Value == 0) {
            button2Value = 20;
          } else if (button2Value == 20) {
            button2Value = 25;
          } else {
            button2Value = 0;
          }
          if (!isButton2Clicked) {
            button11Value++;
            isButton2Clicked = true;
          }
          break;
        case 3:
          if (button3Value == 0) {
            button3Value = 4;
          } else if (button3Value == 4) {
            button3Value = 8;
          } else if (button3Value == 8) {
            button3Value = 16;
          } else if (button3Value == 16) {
            button3Value = 20;
          } else {
            button3Value = 0;
          }
          if (!isButton3Clicked) {
            button11Value++;
            isButton3Clicked = true;
          }
          break;
        case 4:
          if (button4Value == 0) {
            button4Value = 2;
          } else if (button4Value == 2) {
            button4Value = 4;
          } else if (button4Value == 4) {
            button4Value = 6;
          } else if (button4Value == 6) {
            button4Value = 8;
          } else if (button4Value == 8) {
            button4Value = 10;
          } else {
            button4Value = 0;
          }
          if (!isButton4Clicked) {
            button11Value++;
            isButton4Clicked = true;
          }
          break;
        case 5:
          if (button5Value == 0) {
            button5Value = 30;
          } else if (button5Value == 30) {
            button5Value = 35;
          } else {
            button5Value = 0;
          }
          if (!isButton5Clicked) {
            button11Value++;
            isButton5Clicked = true;
          }
          break;
        case 6:
          if (button6Value == 0) {
            button6Value = 5;
          } else if (button6Value == 5) {
            button6Value = 10;
          } else if (button6Value == 10) {
            button6Value = 15;
          } else if (button6Value == 15) {
            button6Value = 20;
          } else if (button6Value == 20) {
            button6Value = 25;
          } else {
            button6Value = 0;
          }
          if (!isButton6Clicked) {
            button11Value++;
            isButton6Clicked = true;
          }
          break;
        case 7:
          if (button7Value == 0) {
            button7Value = 3;
          } else if (button7Value == 3) {
            button7Value = 6;
          } else if (button7Value == 6) {
            button7Value = 9;
          } else if (button7Value == 9) {
            button7Value = 12;
          } else if (button7Value == 12) {
            button7Value = 15;
          } else {
            button7Value = 0;
          }
          if (!isButton7Clicked) {
            button11Value++;
            isButton7Clicked = true;
          }
          break;
        case 8:
          if (button8Value == 0) {
            button8Value = 40;
          } else if (button8Value == 40) {
            button8Value = 45;
          } else {
            button8Value = 0;
          }
          if (!isButton8Clicked) {
            button11Value++;
            isButton8Clicked = true;
          }
          break;
        case 9:
          if (button9Value == 0) {
            button9Value = 6;
          } else if (button9Value == 6) {
            button9Value = 12;
          } else if (button9Value == 12) {
            button9Value = 18;
          } else if (button9Value == 18) {
            button9Value = 24;
          } else if (button9Value == 24) {
            button9Value = 30;
          } else {
            button9Value = 0;
          }
          if (!isButton9Clicked) {
            button11Value++;
            isButton9Clicked = true;
          }
          break;
        case 10:
          if (button10Value == 0) {
            button10Value = 50;
          } else if (button10Value == 50) {
            button10Value = 55;
          } else {
            button10Value = 0;
          }
          if (!isButton10Clicked) {
            button11Value++;
            isButton10Clicked = true;
          }
          break;
      }
      button12Value = button1Value +
          button2Value +
          button3Value +
          button4Value +
          button5Value +
          button6Value +
          button7Value +
          button8Value +
          button9Value +
          button10Value;
    });
    print('Botón $buttonIndex presionado');
  }

  Widget buildButton(int buttonIndex, String label) {
    String displayValue;
    switch (buttonIndex) {
      case 1:
        displayValue = button1Value.toString();
        break;
      case 2:
        displayValue = button2Value.toString();
        break;
      case 3:
        displayValue = button3Value.toString();
        break;
      case 4:
        displayValue = button4Value.toString();
        break;
      case 5:
        displayValue = button5Value.toString();
        break;
      case 6:
        displayValue = button6Value.toString();
        break;
      case 7:
        displayValue = button7Value.toString();
        break;
      case 8:
        displayValue = button8Value.toString();
        break;
      case 9:
        displayValue = button9Value.toString();
        break;
      case 10:
        displayValue = button10Value.toString();
        break;
      default:
        displayValue = "0";
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonIndex),
          child: Text(
            '$label\n$displayValue',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego Del Cacho'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildButton(1, "BALAS"),
                buildButton(2, "ESCALERA"),
                buildButton(3, "CUADRAS"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildButton(4, "TONTOS"),
                buildButton(5, "FULL"),
                buildButton(6, "QUINAS"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildButton(7, "TRICAS"),
                buildButton(8, "POKER"),
                buildButton(9, "SENAS"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildButton(10, "GRANDE"),
              ],
            ),
            const SizedBox(height: 20),
            Text('Turnos: $button11Value', style: const TextStyle(fontSize: 24)),
            Text('Total: $button12Value', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
