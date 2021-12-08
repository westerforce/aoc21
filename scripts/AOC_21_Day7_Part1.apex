List<Integer> crabPositions = AOC_21_07_DataProvider.crabPositions;
//List<Integer> crabPositions = AOC_21_07_DataProvider.crabPositionsTest;

Integer sumCrabs = 0;
for(Integer crab : crabPositions){
    sumCrabs += crab;
}
Integer roundedAverage = Math.round(sumCrabs / crabPositions.size());
List<Integer> differentSums = new List<Integer>();
// brute forcing my way out...
for(Integer i = roundedAverage - 50; i <= roundedAverage + 50; i++){

    List<Integer> distances = new List<Integer>();
    for(Integer crab : crabPositions){
        Integer steps = Math.abs(crab - i);
        distances.add(steps);
    }

    Integer sumDistance = 0;
    for(Integer distance : distances){
        sumDistance += distance;
    }
    differentSums.add(sumDistance);
}

for(Integer i = 0 ; i < differentSums.size() ; i ++) {
    for(Integer j = i+1 ; j <= differentSums.size() -1 ; j ++ ){
        Integer x = 0 ;
        if(differentSums[i] >  differentSums[j]){
            x = differentSums[i]  ;
            differentSums[i] = differentSums[j]  ;
            differentSums[j]  = x;

        }
    }
}

System.debug(differentSums[0]);
