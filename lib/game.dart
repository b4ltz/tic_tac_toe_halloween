// ignore_for_file: avoid_print

class Game {
  List<String> _board = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> get board => _board;

  void doMove(int index, String value) {
    _board[index] = value;
  }

  String? get winner {
    // Row 1
    if ((_board[0] == _board[1]) &&
        (_board[1] == _board[2]) &&
        (_board[2].isNotEmpty)) return _board[0];
    // Row 2
    if ((_board[3] == _board[4]) &&
        (_board[4] == _board[5]) &&
        (_board[5].isNotEmpty)) return _board[3];
    // Row 3
    if ((_board[6] == _board[7]) &&
        (_board[7] == _board[8]) &&
        (_board[8].isNotEmpty)) return _board[6];
    // Col A
    if ((_board[0] == _board[3]) &&
        (_board[3] == _board[6]) &&
        (_board[6].isNotEmpty)) return _board[0];
    // Col B
    if ((_board[1] == _board[4]) &&
        (_board[4] == _board[7]) &&
        (_board[7].isNotEmpty)) return _board[1];
    // Col C
    if ((_board[2] == _board[5]) &&
        (_board[5] == _board[8]) &&
        (_board[8].isNotEmpty)) return _board[2];
    // Diag A
    if ((_board[0] == _board[4]) &&
        (_board[4] == _board[8]) &&
        (_board[8].isNotEmpty)) return _board[0];
    // Diag C
    if ((_board[2] == _board[4]) &&
        (_board[4] == _board[6]) &&
        (_board[6].isNotEmpty)) return _board[2];
    // No winner
    return null;
  }

  void printBoard() {
    print('''
${_board[0].isEmpty ? '_' : _board[0]} ${_board[1].isEmpty ? '_' : _board[1]} ${_board[2].isEmpty ? '_' : _board[2]} 
${_board[3].isEmpty ? '_' : _board[3]} ${_board[4].isEmpty ? '_' : _board[4]} ${_board[5].isEmpty ? '_' : _board[5]} 
${_board[6].isEmpty ? '_' : _board[6]} ${_board[7].isEmpty ? '_' : _board[7]} ${_board[8].isEmpty ? '_' : _board[8]} 
    ''');
  }

  void reset() {
    _board = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }
}
