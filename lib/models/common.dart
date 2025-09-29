// ignore: constant_identifier_names
enum Direction { N, NE, E, SE, S, SW, W, NW }

extension DirectionExtension on Direction {
  String get label {
    switch (this) {
      case Direction.N:
        return 'N';
      case Direction.NE:
        return 'NE';
      case Direction.E:
        return 'E';
      case Direction.SE:
        return 'SE';
      case Direction.S:
        return 'S';
      case Direction.SW:
        return 'SW';
      case Direction.W:
        return 'W';
      case Direction.NW:
        return 'NW';
    }
  }
}
