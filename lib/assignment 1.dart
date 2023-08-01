import 'dart:math';

/// Generate a binary tree with random number of node and random of data.
// TreeNode max: 2
// maxDepth: 10
// Does not know the depth of its leaf
// Each Node will have max value of 100

main() {
  Random random = Random();
  int totalLvl = random.nextInt(10);
  int totalNode = 2 * totalLvl - 1;

  List<int> node=[];

  BinarySearchTree binarySearchTree = BinarySearchTree();
  for (int i = 0; i < totalNode; i++) {
    int nodeValue=random.nextInt(100);
    node.add(nodeValue);
    binarySearchTree.insertValue(nodeValue);
  }
  printTreeArray(node, node.length);

}

class TreeNode {
  int treeValue;
  TreeNode? leftChildNode;
  TreeNode? rightChildNode;

  TreeNode(this.treeValue);
}

class BinarySearchTree {
  TreeNode? treeRoot;

  void insertValue(int value) {
    TreeNode newTreeNode = TreeNode(value);

    if (treeRoot == null) {
      treeRoot = newTreeNode;
    } else {
      TreeNode? currentValue = treeRoot;
      while (true) {
        if (value < currentValue!.treeValue) {
          if (currentValue.leftChildNode == null) {
            currentValue.leftChildNode = newTreeNode;
            break;
          }
          currentValue = currentValue.leftChildNode;
        } else {
          if (currentValue.rightChildNode == null) {
            currentValue.rightChildNode = newTreeNode;
            break;
          }
          currentValue = currentValue.rightChildNode;
        }
      }
    }
  }
}
void printTreeArray(List<int> array, int arrayLength) {
  int currentLevel = 0;
  int maxPerLevel = pow(2, currentLevel).toInt();
  for (int i = 0; i < arrayLength; i++) {
    if (i == maxPerLevel - 1) {
      print("\n");
      currentLevel++;
      maxPerLevel = pow(2, currentLevel).toInt();
    }
    String space="";
    for(int j=0;j<currentLevel;j++){
      space="$space   ";
    }

    print("$space ${array[i]}");
  }
}