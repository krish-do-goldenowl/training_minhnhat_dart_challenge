void printSquare(int squareSize){
  String horizontalLine = " ---" * squareSize;
  String verticalLine = '|   ' * (squareSize + 1);
  for(int i = 0; i < squareSize; i++){
    print(horizontalLine);
    print(verticalLine);
  }
  print(horizontalLine);
}