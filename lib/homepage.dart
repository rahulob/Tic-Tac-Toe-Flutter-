import 'package:flutter/material.dart';
import 'package:tic_tac_toe/gameview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: const GameView(),
    );
  }
}
