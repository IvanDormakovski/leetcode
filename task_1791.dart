// There is an undirected star graph consisting of n nodes labeled from 1 to n. A star
// graph is a graph where there is one center node and exactly n - 1 edges that connect
// the center node with every other node.

// You are given a 2D integer array edges where each edges[i] = [ui, vi] indicates that
// there is an edge between the nodes ui and vi. Return the center of the given star graph.

// Example 1:

// Input: edges = [[1,2],[2,3],[4,2]]
// Output: 2
// Explanation: As shown in the figure above, node 2 is connected to every other node, so 2 is the center.
// Example 2:

// Input: edges = [[1,2],[5,1],[1,3],[1,4]]
// Output: 1

// Basically, a center node must appear in every edge.
class Solution {
  int findCenter(List<List<int>> edges) {
    return edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1]
        ? edges[0][0]
        : edges[0][1];
  }
}

// class Solution {
//   int findCenter(List<List<int>> edges) {
//     Map<int, int> map = {};
//     for (var element in edges) {
//       if (map.containsKey(element[0])) {
//         map.update(element[0], (value) => value + 1);
//       } else {
//         map.putIfAbsent(element[0], () => 1);
//       }

//       if (map.containsKey(element[1])) {
//         map.update(element[1], (value) => value + 1);
//       } else {
//         map.putIfAbsent(element[1], () => 1);
//       }
//     }
//     var maxEntry = map.entries.first;
//     for (var entry in map.entries) {
//       if (entry.value > maxEntry.value) maxEntry = entry;
//     }
//     return maxEntry.key;
//   }
// }

void main(List<String> args) {
  Solution solution = Solution();
  print(solution.findCenter([
    [1, 2],
    [2, 3],
    [4, 2]
  ]));
}
