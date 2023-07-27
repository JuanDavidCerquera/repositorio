import 'package:flutter/material.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

int contador = 0;

class _HomeScreemState extends State<HomeScreem> {
  void incrementar() {
    contador++;
    setState(() {});
  }

  void restar() {
    contador--;
    setState(() {});
  }

  void resetear() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Center(
              child: Text(
            "HomeScreen",
            style: TextStyle(fontSize: 64),
          )),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Numero ce clicks",
                style: TextStyle(fontSize: 32),
              ),
              Text(
                "$contador",
                style: const TextStyle(fontSize: 32),
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomActionButton(
        funAgregar: incrementar,
        funRestar: restar,
        funReset: resetear,
      ),
    ));
  }
}

class CustomActionButton extends StatefulWidget {
  final Function funAgregar;
  final Function funRestar;
  final Function funReset;

  const CustomActionButton({
    super.key,
    required this.funAgregar,
    required this.funRestar,
    required this.funReset,
  });

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.funAgregar();
              });
            }),
        FloatingActionButton(
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              widget.funReset();
            }),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              widget.funRestar();
            }),
      ],
    );
  }
}
