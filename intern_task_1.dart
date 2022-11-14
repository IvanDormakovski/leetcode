// class Runner {
//   bool checkLottery(String? ticketNumber) {
//     if (ticketNumber == null || ticketNumber.length % 2 != 0) return false;
//     List<int> values =
//         ticketNumber.split('').map((value) => int.parse(value)).toList();
//     int firstSum = values
//         .sublist(0, values.length ~/ 2)
//         .reduce((value, element) => value + element);
//     int secondSum = values
//         .sublist(values.length ~/ 2, values.length)
//         .reduce((value, element) => value + element);
//     if (firstSum == secondSum) return true;
//     return false;
//   }
// }

class Runner {
  bool checkLottery(String? ticketNumber) {
    // if (ticketNumber == null) return false;
    // if (ticketNumber.length % 2 != 0) return false;
    if (ticketNumber == null || ticketNumber.length % 2 != 0) return false;
    List<int> values = ticketNumber.split('').map((x) => int.parse(x)).toList();
    int firstSum = 0;
    int secondSum = 0;
    for (int i = 0; i < values.length / 2; i++) {
      firstSum += values[i];
      secondSum += values[values.length - 1 - i];
    }
    if (firstSum == secondSum) return true;
    return false;
  }
}

// class Runner {
//   bool checkLottery(int? ticketNumber) {
//     if (ticketNumber == null) return false;
//     List<int> values = ticketNumber
//         .toString()
//         .split('')
//         .map((value) => int.parse(value))
//         .toList();
//     if (values.length % 2 != 0) return false;
//     int firstSum = 0;
//     int secondSum = 0;
//     for (var i = 0; i < values.length / 2; i++) {
//       firstSum += values[i];
//       secondSum += values[values.length - 1 - i];
//     }
//     if (firstSum == secondSum) return true;
//     return false;
//   }
// }

void main(List<String> args) {
  Runner runner = Runner();
  // print(runner.checkLottery('3360'));
  int x = 6;
  int y = 5;

  List<String> list = ['5', '8', '6', '9'];

  for (int i = 0; i < list.length; i = i + 1) {
    print('${list[i]} vasya');
  }
}
