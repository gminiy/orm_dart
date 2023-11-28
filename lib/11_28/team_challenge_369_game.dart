class Player {
  int clapCount = 0;
  String name;

  Player(this.name);
}

void main() {
  const int playerCount = 4;
  const int maxCount = 100;

  int count = 0;
  int playerIndex = 0;

  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;
  List<Player> players = [];

  for (int i = 1; i <= playerCount; i++) {
    String name = 'Player $i';
    players.add(Player(name));
  }

  do {
    count++;
    Player player = players[playerIndex];
    String message = count.toString();

    if (count % 30 == 0) {
      print('${player.name}: ahh');
      ahhCount++;
    } else if (count % 10 == 0) {
      print('${player.name}: rool');
      roolCount++;
    } else if (count % 3 == 0) {
      print('${player.name}: clap');
      clapCount++;
      player.clapCount++;
    } else {
      print('${player.name}: $message');
    }

    playerIndex = count % playerCount;
  } while (count < maxCount);

  print('clap의 총 개수: $clapCount');
  print('rool의 총 개수: $roolCount');
  print('ahh의 총 개수: $ahhCount');

  for (Player player in players) {
    print('${player.name}: ${player.clapCount}');
  }

  players.sort((a, b) => b.clapCount.compareTo(a.clapCount));
  Player playerWithMaxClap = players[0];

  print(
      'clap 이 가장 많은 플레이어는 ${playerWithMaxClap.name}: ${playerWithMaxClap.clapCount}');
}
