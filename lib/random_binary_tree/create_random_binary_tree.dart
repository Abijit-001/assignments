import 'dart:math';

import 'generate_random_binary_tree.dart';
import 'model.dart';

Random random = Random();

Brunches generateRandomBinaryTree(int maxValue, int currentDepth, int maxDepth) {
  if (currentDepth > maxDepth || random.nextInt(2) == 1 || random.nextInt(2)==2) {
    return Brunches(random.nextInt(maxValue) + 1);
  }

  return Brunches(
    random.nextInt(maxValue) + 1,
    left: generateRandomBinaryTree(maxValue, currentDepth + 1, maxDepth),
    right: generateRandomBinaryTree(maxValue, currentDepth + 1, maxDepth),
  );
}
