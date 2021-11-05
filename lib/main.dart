import 'package:flutter/material.dart';
import 'package:tic_tac_toe_halloween/panel.dart';
import 'package:tic_tac_toe_halloween/top_widget.dart';

import 'game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final game = Game();

  TicValue turn = TicValue.x;
  int _ctr = 0;

  void doMove(int index, TicValue value) {
    String s = value == TicValue.x ? 'X' : 'O';
    game.doMove(index, s);
    setState(() {
      turn = turn == TicValue.x ? TicValue.hand : TicValue.x;
      _ctr++;
    });
    print(game.winner);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe 🎃'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _ctr = 0;
                  turn = TicValue.x;
                  game.reset();
                });
              },
            )
          ],
        ),
        body: Column(
          children: [
            if (game.winner != null)
              TopWidget(
                assetName: game.winner == 'X' ? 'assets/x.png' : 'assets/h.png',
                text: ' WINS THE GAME',
              )
            else if (game.winner == null && _ctr == 9)
              const TopWidget(text: 'THE GAME IS TIE')
            else
              TopWidget(
                assetName: turn == TicValue.x ? 'assets/x.png' : 'assets/h.png',
                text: (turn == TicValue.x ? 'X\'S' : 'HAND\'S') + ' TURN',
              ),
            Expanded(
              child: Row(
                children: [
                  for (int i = 0; i <= 2; i++)
                    Expanded(
                      child: Panel(
                        assetName: game.board[i],
                        value: turn,
                        onPressed: () {
                          doMove(i, turn);
                        },
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  for (int i = 3; i <= 5; i++)
                    Expanded(
                      child: Panel(
                        assetName: game.board[i],
                        value: turn,
                        onPressed: () {
                          doMove(i, turn);
                        },
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  for (int i = 6; i <= 8; i++)
                    Expanded(
                      child: Panel(
                        assetName: game.board[i],
                        value: turn,
                        onPressed: () {
                          doMove(i, turn);
                        },
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
