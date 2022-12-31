import 'package:flutter/material.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  bool playerX = true;
  bool isGameOver = false;
  bool isButtonDisabled = false;
  List xno = ['#', '#', '#', '#', '#', '#', '#', '#', '#'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isGameOver ? "Game Over" : "${playerX ? 'X' : 'O'}'s turn",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30),
            Container(
              width: 300,
              height: 300 - 0.5,
              color: Colors.black,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: List.generate(9, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (isGameOver || xno[index] != '#') return;
                      setState(() {
                        xno[index] = playerX ? 'X' : 'O';
                        playerX = !playerX;
                        isButtonDisabled = false;
                      });
                      checkGameOver();
                    },
                    child: xoContainer(xno[index], index),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isButtonDisabled ? null : resetGame,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  isGameOver ? 'Play Again' : 'Reset Game',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkGameOver() {
    if ((xno[0] != '#' && xno[0] == xno[1] && xno[0] == xno[2]) ||
        (xno[3] != '#' && xno[3] == xno[4] && xno[3] == xno[5]) ||
        (xno[6] != '#' && xno[6] == xno[7] && xno[6] == xno[8]) ||
        (xno[0] != '#' && xno[0] == xno[3] && xno[0] == xno[6]) ||
        (xno[1] != '#' && xno[1] == xno[4] && xno[1] == xno[7]) ||
        (xno[2] != '#' && xno[2] == xno[5] && xno[2] == xno[8]) ||
        (xno[0] != '#' && xno[0] == xno[4] && xno[0] == xno[8]) ||
        (xno[2] != '#' && xno[2] == xno[4] && xno[2] == xno[6])) {
      setState(() => isGameOver = true);
    }
  }

  void resetGame() {
    xno = ['#', '#', '#', '#', '#', '#', '#', '#', '#'];
    setState(() {
      isGameOver = false;
      playerX = true;
      isButtonDisabled = true;
    });
  }
}

Widget xoContainer(String text, int index) {
  return Container(
    decoration: BoxDecoration(color: Colors.grey[300]),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: true ? Colors.black54 : Colors.black,
        ),
      ),
    ),
  );
}
