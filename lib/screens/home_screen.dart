import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;

  List<String> xOrOlist = ["", "", "", "", "", "", "", "", ""];
  int filledBoxes = 0;

  bool gameHaseResult = false;

  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: Text(
          "TicTacToe Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              clearGame();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            getScorrBoard(),
            SizedBox(height: 20.0),
            getResultButton(),
            SizedBox(height: 40.0),
            getGridView(),
            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHaseResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () {
          setState(() {
            gameHaseResult = false;
            clearGame();
          });
        },
        child: Text(
          '$winnerTitle, play again!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  xOrOlist[index],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: xOrOlist[index] == "X" ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    if (gameHaseResult) {
      return;
    }

    setState(() {
      if (xOrOlist[index] != '') {
        return;
      }

      if (isTurnO) {
        xOrOlist[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOrOlist[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }

      isTurnO = !isTurnO;

      checkWineer();
    });
  }

  void checkWineer() {
    if (xOrOlist[0] == xOrOlist[1] &&
        xOrOlist[0] == xOrOlist[2] &&
        xOrOlist[0] != '') {
      setResult(xOrOlist[0], 'winner is ' + xOrOlist[0]);
      return;
    }

    if (xOrOlist[3] == xOrOlist[4] &&
        xOrOlist[3] == xOrOlist[5] &&
        xOrOlist[3] != '') {
      setResult(xOrOlist[3], 'winner is ' + xOrOlist[3]);

      return;
    }

    if (xOrOlist[6] == xOrOlist[7] &&
        xOrOlist[6] == xOrOlist[8] &&
        xOrOlist[6] != '') {
      setResult(xOrOlist[6], 'winner is ' + xOrOlist[6]);

      return;
    }

    if (xOrOlist[0] == xOrOlist[3] &&
        xOrOlist[0] == xOrOlist[6] &&
        xOrOlist[0] != '') {
      setResult(xOrOlist[0], 'winner is ' + xOrOlist[0]);
      return;
    }

    if (xOrOlist[1] == xOrOlist[4] &&
        xOrOlist[1] == xOrOlist[7] &&
        xOrOlist[1] != '') {
      setResult(xOrOlist[1], 'winner is ' + xOrOlist[1]);
      return;
    }

    if (xOrOlist[2] == xOrOlist[5] &&
        xOrOlist[2] == xOrOlist[8] &&
        xOrOlist[2] != '') {
      setResult(xOrOlist[2], 'winner is ' + xOrOlist[2]);
      return;
    }

    if (xOrOlist[0] == xOrOlist[4] &&
        xOrOlist[0] == xOrOlist[8] &&
        xOrOlist[0] != '') {
      setResult(xOrOlist[0], 'winner is ' + xOrOlist[0]);
      return;
    }

    if (xOrOlist[2] == xOrOlist[4] &&
        xOrOlist[2] == xOrOlist[6] &&
        xOrOlist[2] != '') {
      setResult(xOrOlist[2], 'winner is ' + xOrOlist[2]);
      return;
    }

    if (filledBoxes == 9) {
      setResult('', 'Draw');
    }
  }

  Widget getScorrBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.00),
                child: Text(
                  "Player O",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.00),
                child: Text(
                  "$scoreO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.00),
                child: Text(
                  "Player X",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.00),
                child: Text(
                  "$scoreX",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void setResult(String winner, String title) {
    setState(() {
      gameHaseResult = true;
      winnerTitle = title;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      } else {
        scoreX = scoreX + 1;
        scoreO = scoreO + 1;
      }
    });
  }

  void clearGame() {
    setState(() {
      for (int i = 0; i < xOrOlist.length; i++) {
        xOrOlist[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
