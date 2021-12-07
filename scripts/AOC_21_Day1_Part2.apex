//List<Integer> christmasData = AOC_21_01_DataProvider.provideChristmasTestData();
List<Integer> christmasData = AOC_21_01_DataProvider.provideChristmasData();

Integer increaseCounter = 0;
// start from 1st pos because there is no increase on the first measurement.
for(Integer i = 1; i < christmasData.size() - 2; i++) {
    Integer christmasOverlap = christmasData[i] + christmasData[i + 1];
    if(christmasData[i - 1] + christmasOverlap < christmasData[i + 2] + christmasOverlap) increaseCounter++;
}
System.debug(increaseCounter);
