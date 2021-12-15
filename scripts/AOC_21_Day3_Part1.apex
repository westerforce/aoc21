//List<String> waterData = AOC_21_03_DataProvider.waterDataTest;
List<String> waterData = AOC_21_03_DataProvider.waterData;

String gammaRate = '';
String epsilonRate = '';
Integer valuesLength = waterData[0].length();

for(Integer m = 0; m < valuesLength; m++) {
    Integer zeroCount = 0;
    for(String metric : waterData) {
        if(metric.substring(m, m + 1) == '0') {
            zeroCount++;
        }
    }
    if(zeroCount > waterData.size() / 2) {
        gammaRate += '0';
        epsilonRate += '1';
    } else {
        gammaRate += '1';
        epsilonRate += '0';
    }
}

Integer gammaValue = 0;
for(String s : gammaRate.split('')) {
    gammaValue = (gammaValue << 1) | (s == '1'? 1 : 0);
}

Integer epsilonValue = 0;
for(String s : epsilonRate.split('')) {
    epsilonValue = (epsilonValue << 1) | (s == '1'? 1 : 0);
}

System.debug(gammaValue * epsilonValue);
