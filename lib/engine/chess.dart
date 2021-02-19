import 'dart:io';

//FEN Strings
String startPos = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
String testPos = "r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - 0 1";

enum Piece { b, B, k, K, n, N, p, P, q, Q, r, R, _, o }

extension on Piece {
  String get ascii {
    switch (this) {
      case Piece.b:
        return 'b';

      case Piece.B:
        return 'B';

      case Piece.k:
        return 'k';

      case Piece.K:
        return 'K';

      case Piece.n:
        return 'n';

      case Piece.N:
        return 'N';

      case Piece.p:
        return 'p';

      case Piece.P:
        return 'P';

      case Piece.q:
        return 'q';

      case Piece.Q:
        return 'Q';

      case Piece.r:
        return 'r';

      case Piece.R:
        return 'R';

      case Piece._:
        return '.';

      default:
        return null;
    }
  }

  String get unicode {
    switch (this) {
      case Piece.b:
        return '♗';

      case Piece.B:
        return '♝';

      case Piece.k:
        return '♔';

      case Piece.K:
        return '♚';

      case Piece.n:
        return '♘';

      case Piece.N:
        return '♞';

      case Piece.p:
        return '♙';

      case Piece.P:
        return '♟︎';

      case Piece.q:
        return '♕';

      case Piece.Q:
        return '♛';

      case Piece.r:
        return '♖';

      case Piece.R:
        return '♜';

      case Piece._:
        return '.';

      default:
        return null;
    }
  }
}

const List<Piece> StartingBoard = [
  Piece.r,
  Piece.n,
  Piece.b,
  Piece.q,
  Piece.k,
  Piece.b,
  Piece.n,
  Piece.r,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.p,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece._,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.P,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.R,
  Piece.N,
  Piece.B,
  Piece.Q,
  Piece.K,
  Piece.B,
  Piece.N,
  Piece.R,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o
];

const Map<String, int> SquaresToCoords = const {
  'a8': 0,
  'b8': 1,
  'c8': 2,
  'd8': 3,
  'e8': 4,
  'f8': 5,
  'g8': 6,
  'h8': 7,
  'a7': 16,
  'b7': 17,
  'c7': 18,
  'd7': 19,
  'e7': 20,
  'f7': 21,
  'g7': 22,
  'h7': 23,
  'a6': 32,
  'b6': 33,
  'c6': 34,
  'd6': 35,
  'e6': 36,
  'f6': 37,
  'g6': 38,
  'h6': 39,
  'a5': 48,
  'b5': 49,
  'c5': 50,
  'd5': 51,
  'e5': 52,
  'f5': 53,
  'g5': 54,
  'h5': 55,
  'a4': 64,
  'b4': 65,
  'c4': 66,
  'd4': 67,
  'e4': 68,
  'f4': 69,
  'g4': 70,
  'h4': 71,
  'a3': 80,
  'b3': 81,
  'c3': 82,
  'd3': 83,
  'e3': 84,
  'f3': 85,
  'g3': 86,
  'h3': 87,
  'a2': 96,
  'b2': 97,
  'c2': 98,
  'd2': 99,
  'e2': 100,
  'f2': 101,
  'g2': 102,
  'h2': 103,
  'a1': 112,
  'b1': 113,
  'c1': 114,
  'd1': 115,
  'e1': 116,
  'f1': 117,
  'g1': 118,
  'h1': 119,
};

void printBoard(List<Piece> board) {
  for (int rank = 0; rank < 8; rank++) {
    for (int file = 0; file < 16; file++) {
      int square = 16 * rank + file;

      if ((square & 0x88) == 0) {
        stdout.write(board[square].unicode + ' ');
      }
    }
    print('');
  }
}

class Chess {
  List<String> board = List(128);
}

main(List<String> args) {
  printBoard(StartingBoard);
}
