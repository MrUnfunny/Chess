import 'package:flutter/material.dart';

/// This file contains code to show the chessboard in the app.

class BoardColor {
  final Color darkSquareColor;
  final Color lightSquareColor;

  const BoardColor({this.darkSquareColor, this.lightSquareColor});
}

class ChessBoard extends StatelessWidget {
  const ChessBoard({
    this.size = 300,
    this.boardColor = const BoardColor(
      darkSquareColor: Color(0xFFB58863),
      lightSquareColor: Color(0xFFF0D9B5),
    ),
  });

  final double size;
  final BoardColor boardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemCount: 64,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: size / 8,
            height: size / 8,
            color: ((index / 8).floor() % 2 == 0)
                ? (index % 2 == 0)
                    ? this.boardColor.darkSquareColor
                    : this.boardColor.lightSquareColor
                : (index % 2 == 0)
                    ? this.boardColor.lightSquareColor
                    : this.boardColor.darkSquareColor,
          );
        },
      ),
    );
  }
}
