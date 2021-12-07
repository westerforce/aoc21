//List<Integer> crabPositions = AOC_21_07_DataProvider.crabPositions;
List<Integer> crabPositions = AOC_21_07_DataProvider.crabPositionsTest;

Integer sumCrabs = 0;
for(Integer c = 0, t = crabPositions.size() - 1; c <= t; c++){
    sumCrabs += crabPositions[c];
}

// As the answer is in the periphery of the average, so we bruteforce from there.
Integer averageCrabPosition = Integer.valueOf(Math.round(Decimal.valueOf(sumCrabs) / Decimal.valueOf(crabPositions.size())));

Map<Integer, Integer> distanceMap = new Map<Integer, Integer>();
Integer sumOfDistances = 0;
for(Integer d = 0; d <= 10000; d++){
    distanceMap.put(d, sumOfDistances + d);
    sumOfDistances += d;
}

Integer lowestDistance = 999999999;
for(Integer p = -10; p < 10; p++){
    Integer sumDistance = 0;
    for(Integer c = 0, t = crabPositions.size() - 1; c <= t; c++){
        Integer steps = Math.abs(crabPositions[c] - averageCrabPosition + p);
        sumDistance += distanceMap.get(steps);
    }
    if(sumDistance < lowestDistance){
        lowestDistance = sumDistance;
    }

}
System.debug(lowestDistance);
