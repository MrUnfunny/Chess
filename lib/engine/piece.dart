enum Piece { b, B, k, K, n, N, p, P, q, Q, r, R, e, o }

extension PieceChar on Piece {
  String get char {
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

      case Piece.e:
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

      case Piece.e:
        return '.';

      default:
        return null;
    }
  }
}
