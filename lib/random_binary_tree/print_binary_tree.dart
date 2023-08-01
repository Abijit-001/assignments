import 'model.dart';

void printBinaryTree(Brunches? node, [String prefix = '', bool isLeft = true]) {
  if (node == null) return;

  printBinaryTree(node.right, '$prefix${isLeft ? '│   ' : '    '}', false);

  print('$prefix${isLeft ? '|── ' : '|── '}${node.value}');

  printBinaryTree(node.left, '$prefix${isLeft ? '    ' : '│   '}', true);
}
