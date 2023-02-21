import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;

  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  void reiniciar() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloTexto = TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: const Text('Home Screen'),
        elevation: 10,
      ),
      backgroundColor: Color.fromARGB(255, 86, 32, 233),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Numero de taps:',
            style: estiloTexto,
          ),
          Text('$contador', style: estiloTexto),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFoatingActionButton(
        decrease: decrementar,
        increase: incrementar,
        reset: reiniciar,
      ),
    );
  }
}

class CustomFoatingActionButton extends StatelessWidget {
  final Function increase;
  final Function decrease;
  final Function reset;

  const CustomFoatingActionButton({
    Key? key,
    required this.increase,
    required this.decrease,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          onPressed: () => decrease(),
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          onPressed: () => reset(),
          child: const Icon(Icons.restart_alt_rounded),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          onPressed: () => increase(),
          child: const Icon(Icons.exposure_plus_1),
        ),
      ],
    );
  }
}