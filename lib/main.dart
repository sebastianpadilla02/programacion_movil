import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Sudoku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Sudoku(),
    );
  }
}

class Sudoku extends StatelessWidget {
  const Sudoku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Sudoku for kids'),
        ),
        body: const Center(
          child: Column(
            children: [
              Spacer(),
              Board(),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(child: Text('Option 1')),
                      ),
                      Expanded(
                        child: Center(child: Text('Option 2')),
                      ),
                      Expanded(
                        child: Center(child: Text('Option 3')),
                      ),
                      Expanded(
                        child: Center(child: Text('Option 4')),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400, // Ancho del contenedor
        height: 400, // Alto del contenedor
        child: GridView.count(
          crossAxisCount: 2, // 2 columnas
          children: List.generate(4, (index1) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              margin: EdgeInsets.all(0.5), // Espacio entre los cuadrados
              //color: Theme.of(context).colorScheme.inversePrimary, // Color de los cuadrados
              child: GridView.count(
                crossAxisCount: 2, // 2 columnas
                children: List.generate(4, (index2) {
                   return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    margin: EdgeInsets.all(3.0), // Espacio entre los cuadrados
                    //color: Colors.white, // Color de los cuadrados
                     child: Center(child: Text(index2 %2 == 0 ? '1': '2'),),
                   );
                }),
             ),
            );
          }),
        ),
      ),
    );
  }
}