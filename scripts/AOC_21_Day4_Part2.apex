//String boardsInput = AOC_21_04_DataProvider.bingoSetsTest;
//List<Integer> bingoValues = AOC_21_04_DataProvider.bingoValuesTest;
String boardsInput = AOC_21_04_DataProvider.bingoSets;
List<Integer> bingoValues = AOC_21_04_DataProvider.bingoValues;

List<List<Set<Integer>>> boardsCollection = new List<List<Set<Integer>>>();

for(String b : boardsInput.split('\n\n')) {
    List<String> allBoardValues = b.trim().replaceAll('\n', ' ').replaceAll('  ', ' ').split(' ');
    List<Set<Integer>> currentBoard = new List<Set<Integer>>(10);
    Integer columnCounter = 0;
    Integer rowCounter = 5;
    for(Integer v = 0; v < allBoardValues.size(); v++) {
        columnCounter = Math.mod(v, 5);
        if(currentBoard[rowCounter] == null) { currentBoard[rowCounter] = new Set<Integer>(); }
        currentBoard[rowCounter].add(Integer.valueOf(allBoardValues[v]));
        if(currentBoard[columnCounter] == null) { currentBoard[columnCounter] = new Set<Integer>(); }
        currentBoard[columnCounter].add(Integer.valueOf(allBoardValues[v]));
        if(columnCounter == 4) rowCounter++;
    }
    boardsCollection.add(currentBoard);
}

Integer drawedNumber = 0;
List<Set<Integer>> winningBoard = new List<Set<Integer>>();
Integer drawCounter = -1;
Integer bingoCounter = 0;
while(bingoCounter < boardsCollection.size()) {
    drawCounter++;
    Integer bingoDraw = bingoValues[drawCounter];
    for(Integer bingoIterator = 0; bingoIterator < boardsCollection.size(); bingoIterator++) {
        Boolean hasBingo = false;
        for(Set<Integer> bingoSet : boardsCollection[bingoIterator]) {
            bingoSet.remove(bingoDraw);
            if(bingoSet.isEmpty()) {
                drawedNumber = bingoDraw;
                hasBingo = true;
                if(bingoCounter == boardsCollection.size() - 1) {
                    winningBoard = boardsCollection[bingoIterator];
                } else {
                    boardsCollection[bingoIterator] = new List<Set<Integer>>();
                }
            }
        }
        if(hasBingo) {bingoCounter++;}
    }
}
Set<Integer> deduplicatedValues = new Set<Integer>();
for(Set<Integer> rowOrColumn : winningBoard) {
    deduplicatedValues.addAll(rowOrColumn);
}
Integer remainingBoardSum = 0;
for(Integer value : deduplicatedValues) {
    remainingBoardSum += value;
}
System.debug(drawedNumber * remainingBoardSum);
