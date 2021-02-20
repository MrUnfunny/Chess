import 'dart:io';

import 'piece.dart';

bool isInt(String num) {
  if (num == null) {
    return false;
  } else {
    return int.tryParse(num) != null;
  }
}

class FEN {
  String piecePlacement;
  String activeColor;
  String castling;
  String enPassant;
  String halfMove;
  String fullMove;

  FEN(String fenString) {
    final fen = fenString.split(' ');

    validateFen(fenString);

    this.piecePlacement = fen[0];
    this.activeColor = fen[1];
    this.castling = fen[2];
    this.enPassant = fen[3];
    this.halfMove = fen[4];
    this.fullMove = fen[5];
  }

  validateFen(String fenString) {
    final fen = fenString.split(' ');

    //Checking Fen String Length
    if (fen.length != 6) {
      throw Exception("Invalid FEN String -- String does not have 6 components");
    }

    //Checks if piecePlacement has 8 ranks
    final fenRows = fen[0].split('/');

    if (fenRows.length != 8) {
      throw Exception("Invalid FEN String -- Number of ranks is not equal to 8");
    }

    //Checks if each file is valid
    List<String> chars = ['p', 'P', 'r', 'R', 'n', 'N', 'b', 'B', 'q', 'Q', 'k', 'K'];

    bool darkKingPresent = false;
    bool lightKingPresent = false;

    for (int i = 0; i < fenRows.length; i++) {
      int sum = 0;
      for (int j = 0; j < fenRows[i].length; j++) {
        if (chars.contains(fenRows[i][j])) {
          if (fenRows[i][j] == 'k') {
            if (darkKingPresent) {
              throw Exception("Invalid FEN -- multiple Dark Kings");
            } else {
              darkKingPresent = true;
            }
          }
          if (fenRows[i][j] == 'K') {
            if (lightKingPresent) {
              throw Exception("Invalid FEN -- multiple Light Kings");
            } else {
              lightKingPresent = true;
            }
          }
          sum++;
        } else if (isInt(fenRows[i][j])) {
          if (j + 1 < fenRows[i].length && isInt(fenRows[i][j + 1])) {
            throw Exception("Invalid FEN String -- Consecutive integers in file ${i + 1} ");
          }
          sum += int.parse(fenRows[i][j]);
        }
      }
      if (sum != 8) {
        throw Exception("Invalid FEN String -- Number of squares in file ${i + 1} is not equal to 8");
      }
    }

    //Checks if piecePlacement contains 1 black and 1 white king
    if (!darkKingPresent || !lightKingPresent) {
      throw Exception("Invalid FEN String -- 1 black and 1 white king expected in piecePlacement");
    }

    //Checks for valid activeColor
    RegExp activeColorCheck = RegExp(r"^(w|b)$");
    if (activeColorCheck.firstMatch(fen[1]) == null) {
      throw Exception("Invalid FEN String -- Invalid Active Color");
    }

    //Checks for valid Castling Rights
    RegExp castlingCheck = RegExp(r"^(K?Q?k?q?|-)$");
    if (castlingCheck.firstMatch(fen[2]) == null) {
      throw Exception("Invalid FEN String -- Invalid Castling Rights");
    }

    //Checks for valid en passant square
    RegExp enPassantCheck = RegExp(r"^([a-h][36]|-)");
    if (enPassantCheck.firstMatch(fen[3]) == null) {
      throw Exception("Invalid FEN String -- Invalid En Passant Square");
    }

    //Checks for valid Half Move
    if (!isInt(fen[4])) {
      throw Exception("Invalid FEN String -- Invalid Half Move");
    } else if (int.parse(fen[4]) < 0) {
      throw Exception("Invalid FEN String -- Negative Half Move");
    }

    //Checks for valid Full Move
    if (!isInt(fen[5])) {
      throw Exception("Invalid FEN String -- Invalid Full Move");
    } else if (int.parse(fen[5]) < 0) {
      throw Exception("Invalid FEN String -- Negative Full Move");
    }
  }

  static Piece fenToPiece(String fen) {
    switch (fen) {
      case 'b':
        return Piece.b;

      case 'B':
        return Piece.B;

      case 'n':
        return Piece.n;

      case 'N':
        return Piece.N;

      case 'p':
        return Piece.p;

      case 'P':
        return Piece.P;

      case 'q':
        return Piece.q;

      case 'Q':
        return Piece.Q;

      case 'k':
        return Piece.k;

      case 'K':
        return Piece.K;

      case 'r':
        return Piece.r;

      case 'R':
        return Piece.R;

      case 'e':
        return Piece.e;

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
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.o,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
  Piece.e,
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

    stdout.write("         |         ");

    for (int file = 0; file < 16; file++) {
      int square = 16 * rank + file;

      if ((square & 0x88) == 0) {
        stdout.write(board[square].char + ' ');
      }
    }
    print('');
  }
}

class Chess {
  List<Piece> board = List(128);

  static List<Piece> resetBoard(List<Piece> board) {
    for (int rank = 0; rank < 8; rank++) {
      for (int file = 0; file < 16; file++) {
        int square = 16 * rank + file;
        if ((square & 0x88) == 0) board[square] = Piece.e;
      }
    }
    return board;
  }

  static List<Piece> updateBoard(String fenString) {
    List<Piece> myBoard = List(128);
    int findex = 0;

    myBoard = resetBoard(myBoard);

    for (int rank = 0; rank < 8; rank++) {
      for (int file = 0; file < 16; file++) {
        int square = 16 * rank + file;

        if ((square & 0x88) == 0) {
          RegExp pieceChecker = RegExp(r"^[rnbqkpRNBQKP]$");
          if (pieceChecker.firstMatch(fenString[findex]) != null) {
            myBoard[square] = FEN.fenToPiece(fenString[findex]);
            findex++;
          }

          if (isInt(fenString[findex])) {
            if (myBoard[square] == Piece.e) {
              file--;
            }
            file += int.parse(fenString[findex]);
            findex++;
          }

          if (fenString[findex] == '/') {
            findex++;
          }
        }
      }
    }
    return myBoard;
  }
}
