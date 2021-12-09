String lavaMap = AOC_21_09_DataProvider.lavaMap;

List<String> lavaRows = lavaMap.split('\n');
Integer rowSize = lavaRows[0].length();
List<Integer> lowPoints = new List<Integer>();

for(Integer r = 0; r < lavaRows.size(); r++) {
    
    String row = lavaRows[r];

    if(r == 0){
        String nextRow = lavaRows[r+1];
        for(Integer i = 0, s = rowSize; i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer bottom = Integer.valueOf(nextRow.substring(i, i+1));
            // upper left
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < bottom && toEvaluate < right) lowPoints.add(toEvaluate);
            } else if(i == rowSize - 1){
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < left && toEvaluate < bottom) lowPoints.add(toEvaluate);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < bottom && toEvaluate < right && toEvaluate < left) lowPoints.add(toEvaluate);
            }
        }
    } else if(r == lavaRows.size() - 1){
        String previousRow = lavaRows[r-1];
        for(Integer i = 0, s = rowSize; i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer top = Integer.valueOf(previousRow.substring(i, i+1));
            // upper left
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < top && toEvaluate < right) lowPoints.add(toEvaluate);
            } else if(i == rowSize - 1){
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < left && toEvaluate < top) lowPoints.add(toEvaluate);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1, i));
                if(toEvaluate < top && toEvaluate < right && toEvaluate < left) lowPoints.add(toEvaluate);
            }
        }
    } else {
        String nextRow = lavaRows[r+1];
        String previousRow = lavaRows[r-1];
        for(Integer i = 0, s = rowSize; i < s; i++) {
            Integer toEvaluate = Integer.valueOf(row.substring(i,i+1));
            Integer bottom = Integer.valueOf(nextRow.substring(i, i+1));
            Integer top = Integer.valueOf(previousRow.substring(i, i+1));
            // left side
            if(i == 0) {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                if(toEvaluate < top && toEvaluate < right && toEvaluate < bottom) lowPoints.add(toEvaluate);
            } else if(i == rowSize - 1){
                Integer left = Integer.valueOf(row.substring(i-1,i));
                if(toEvaluate < top && toEvaluate < left && toEvaluate < bottom) lowPoints.add(toEvaluate);
            } else {
                Integer right = Integer.valueOf(row.substring(i+1,i+2));
                Integer left = Integer.valueOf(row.substring(i-1,i));
                if(toEvaluate < top && toEvaluate < left && toEvaluate < bottom && toEvaluate < right) lowPoints.add(toEvaluate);
            }
        }
    }
    
    
    
}

System.debug(lowPoints);
Integer sum = 0;
for(Integer lowPoint : lowPoints){
    sum+=lowPoint + 1;
}
System.debug(sum);
