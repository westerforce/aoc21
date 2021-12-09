//String lavaMap = AOC_21_09_DataProvider.lavaMapTest;
String lavaMap = AOC_21_09_DataProvider.lavaMap;

List<List<Integer>> basinMap = new List<List<Integer>>();
List<String> lavaRows = lavaMap.split('\n');
for(String s : lavaRows){
    List<Integer> rowData = new List<Integer>();
    for(String st : s.split('')){
        rowData.add(Integer.valueOf(st));
    }
    basinMap.add(rowData);
}
List<List<Integer>> originalMap = basinMap.clone();

List<String> basinBottoms = new List<String>();

for(Integer r = 0; r < lavaRows.size(); r++) {

    String row = lavaRows[r];

    if(r == 0){
        String nextRow = lavaRows[r+1];
        for(Integer i = 0, s = basinMap[0].size(); i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer bottom = Integer.valueOf(nextRow.substring(i, i+1));
            // upper left
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < bottom && toEvaluate < right) basinBottoms.add(r + '-' + i);
            } else if(i == basinMap[0].size() - 1){
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < left && toEvaluate < bottom) basinBottoms.add(r + '-' + i);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < bottom && toEvaluate < right && toEvaluate < left) basinBottoms.add(r + '-' + i);
            }
        }
    } else if(r == lavaRows.size() - 1){
        String previousRow = lavaRows[r-1];
        for(Integer i = 0, s = basinMap[0].size(); i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer top = Integer.valueOf(previousRow.substring(i, i+1));
            // upper left
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < top && toEvaluate < right) basinBottoms.add(r + '-' + i);
            } else if(i == basinMap[0].size() - 1){
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < left && toEvaluate < top) basinBottoms.add(r + '-' + i);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < top && toEvaluate < right && toEvaluate < left) basinBottoms.add(r + '-' + i);
            }
        }
    } else {
        String nextRow = lavaRows[r+1];
        String previousRow = lavaRows[r-1];
        for(Integer i = 0, s = basinMap[0].size(); i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer bottom = Integer.valueOf(nextRow.substring(i, i+1));
            Integer top = Integer.valueOf(previousRow.substring(i, i+1));
            // left side
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < top && toEvaluate < right && toEvaluate < bottom) basinBottoms.add(r + '-' + i);
            } else if(i == basinMap[0].size() - 1){
                Integer left = Integer.valueOf(row.substring(i-1,i));
                if(toEvaluate < top && toEvaluate < left && toEvaluate < bottom) basinBottoms.add(r + '-' + i);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1,i));
                if(toEvaluate < top && toEvaluate < left && toEvaluate < bottom && toEvaluate < right) basinBottoms.add(r + '-' + i);
            }
        }
    }

}

Integer climbing(Integer row, Integer column){
    
    Integer basinSize = 0;
    
    if(basinMap[row][column] != -1){
        basinMap[row][column] = -1;
        basinSize += 1;
    }
    
    Boolean checkAbove = true;
    Boolean checkBelow = true;
    Boolean checkRight = true;
    Boolean checkLeft = true;
    
    if(row == 0) {
        checkAbove = false;
    } else if(row == basinMap.size() - 1) {
        checkBelow = false;
    }
    
    if(column == 0){
        checkLeft = false;
    } else if(column == basinMap[0].size() -1) {
        checkRight = false;
    }
    
    if(checkAbove && basinMap[row-1][column] != -1 && originalMap[row-1][column] != 9){
        basinMap[row-1][column] = -1;
        basinSize += climbing(row-1, column);
        basinSize += 1;
    }

    if(checkBelow && basinMap[row+1][column] != -1 && originalMap[row+1][column] != 9){
        basinMap[row+1][column] = -1;
        basinSize += climbing(row+1, column);
        basinSize += 1;
    }

    if(checkLeft && basinMap[row][column-1] != -1 && originalMap[row][column-1] != 9){
        basinMap[row][column-1] = -1;
        basinSize += climbing(row, column-1);
        basinSize += 1;
    }

    if(checkRight && basinMap[row][column+1] != -1 && originalMap[row][column+1] != 9){
        basinMap[row][column+1] = -1;
        basinSize += climbing(row, column+1);
        basinSize += 1;
    }
    
    return basinSize;
}

List<Integer> basinSizes = new List<Integer>();

for(String coordinate : basinBottoms) {
    Integer basinSize = climbing(
        Integer.valueOf(coordinate.split('-')[0]),
        Integer.valueOf(coordinate.split('-')[1])
    );
    basinSizes.add(basinSize);
}

basinSizes.sort();

System.debug(basinSizes[basinSizes.size()-1] * basinSizes[basinSizes.size()-2] * basinSizes[basinSizes.size()-3]);