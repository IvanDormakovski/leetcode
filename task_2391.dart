// You are given a 0-indexed array of strings garbage where garbage[i] represents the assortment of garbage at the ith house. garbage[i] consists only of the characters 'M', 'P' and 'G' representing one unit of metal, paper and glass garbage respectively. Picking up one unit of any type of garbage takes 1 minute.

// You are also given a 0-indexed integer array travel where travel[i] is the number of minutes needed to go from house i to house i + 1.

// There are three garbage trucks in the city, each responsible for picking up one type of garbage. Each garbage truck starts at house 0 and must visit each house in order; however, they do not need to visit every house.

// Only one garbage truck may be used at any given moment. While one truck is driving or picking up garbage, the other two trucks cannot do anything.

// Return the minimum number of minutes needed to pick up all the garbage.

// Example 1:

// Input: garbage = ["G","P","GP","GG"], travel = [2,4,3]
// Output: 21
// Explanation:
// The paper garbage truck:
// 1. Travels from house 0 to house 1
// 2. Collects the paper garbage at house 1
// 3. Travels from house 1 to house 2
// 4. Collects the paper garbage at house 2
// Altogether, it takes 8 minutes to pick up all the paper garbage.
// The glass garbage truck:
// 1. Collects the glass garbage at house 0
// 2. Travels from house 0 to house 1
// 3. Travels from house 1 to house 2
// 4. Collects the glass garbage at house 2
// 5. Travels from house 2 to house 3
// 6. Collects the glass garbage at house 3
// Altogether, it takes 13 minutes to pick up all the glass garbage.
// Since there is no metal garbage, we do not need to consider the metal garbage truck.
// Therefore, it takes a total of 8 + 13 = 21 minutes to collect all the garbage.
// Example 2:

// Input: garbage = ["MMM","PGM","GP"], travel = [3,10]
// Output: 37
// Explanation:
// The metal garbage truck takes 7 minutes to pick up all the metal garbage.
// The paper garbage truck takes 15 minutes to pick up all the paper garbage.
// The glass garbage truck takes 15 minutes to pick up all the glass garbage.
// It takes a total of 7 + 15 + 15 = 37 minutes to collect all the garbage.

class Solution {
  int garbageCollection(List<String> garbage, List<int> travel) {
    int res = 0;
    List<int> last = List.filled(128, 0);
    for (int i = 0; i < garbage.length; ++i) {
      res += garbage[i].length;
      for (int j = 0; j < garbage[i].length; ++j)
        last[garbage[i].codeUnitAt(j)] = i;
    }
    for (int j = 1; j < travel.length; ++j) travel[j] += travel[j - 1];
    for (int c in "PGM".codeUnits) if (last[c] > 0) res += travel[last[c] - 1];
    return res;
  }
}

// class Solution {
//   int garbageCollection(List<String> garbage, List<int> travel) {
//     // lastPickUpForEachTrack[0] == "G", lastPickUpForEachTrack[1] == "P", lastPickUpForEachTrack[2] == "M";
//     List<int> lastPickUpForEachTrack = [0, 0, 0];
//     int garbagesPickUpTotalTime = garbage.fold(
//         0, (previousValue, element) => previousValue + element.length);

//     for (var i = 0; i < garbage.length; i++) {
//       if (garbage[i].contains('G')) lastPickUpForEachTrack[0] = i;
//       if (garbage[i].contains('P')) lastPickUpForEachTrack[1] = i;
//       if (garbage[i].contains('M')) lastPickUpForEachTrack[2] = i;
//     }

//     for (var i = 0; i < lastPickUpForEachTrack.length; i++) {
//       garbagesPickUpTotalTime +=
//           calculateTravel(lastPickUpForEachTrack[i], travel);
//     }
//     return garbagesPickUpTotalTime;
//   }

//   int calculateTravel(int i, List<int> travel) {
//     if (i == 0 || i == -1) return 0;
//     if (i < travel.length) {
//       return travel.sublist(0, i).reduce((value, element) => value + element);
//     } else {
//       return travel.reduce((value, element) => value + element);
//     }
//   }
// }

// class Solution {
//   int garbageCollection(List<String> garbage, List<int> travel) {
//     int garbagesPickUpTotalTime = garbage.fold(
//         0, (previousValue, element) => previousValue + element.length);
//     garbagesPickUpTotalTime += calculateTravel(
//         garbage.lastIndexWhere((element) => element.contains('G')), travel);
//     garbagesPickUpTotalTime += calculateTravel(
//         garbage.lastIndexWhere((element) => element.contains('P')), travel);
//     garbagesPickUpTotalTime += calculateTravel(
//         garbage.lastIndexWhere((element) => element.contains('M')), travel);

//     return garbagesPickUpTotalTime;
//   }

//   int calculateTravel(int i, List<int> travel) {
//     if (i == 0 || i == -1) return 0;
//     if (i < travel.length) {
//       return travel.sublist(0, i).reduce((value, element) => value + element);
//     } else {
//       return travel.reduce((value, element) => value + element);
//     }
//   }
// }

// class Solution {
//   int garbageCollection(List<String> garbage, List<int> travel) {
//     List<bool> exlude = [false, false, false];
//     int garbagesPickUpTotalTime = garbage.fold(
//         0, (previousValue, element) => previousValue + element.length);
//     int trackTime = 0;
//     for (var i = garbage.length - 1; i >= 1; i--) {
//       if (garbage[i].contains('G') && !exlude[0]) {
//         exlude[0] = true;
//         trackTime += calculateTravel(i, travel);
//       }
//       if (garbage[i].contains('P') && !exlude[1]) {
//         exlude[1] = true;
//         trackTime += calculateTravel(i, travel);
//       }
//       if (garbage[i].contains('M') && !exlude[2]) {
//         exlude[2] = true;
//         trackTime += calculateTravel(i, travel);
//       }
//     }
//     return garbagesPickUpTotalTime + trackTime;
//   }

// int calculateTravel(int i, List<int> travel) {
//   if (i < travel.length) {
//     return travel.sublist(0, i).reduce((value, element) => value + element);
//   } else {
//     return travel.reduce((value, element) => value + element);
//   }
// }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.garbageCollection(["G", "P", "GP", "GG"], [2, 4, 3]));
}
