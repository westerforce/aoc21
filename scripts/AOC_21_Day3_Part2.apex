List<String> waterData = AOC_21_03_DataProvider.waterDataTest;
List<String> oxygenData = waterData.clone();
List<String> co2Data = waterData.clone();

while(oxygenData.size() > 1){
    // iterate over positions
    Integer oxygenHalfSize = oxygenData.size() / 2;
    for(Integer i = 0; i < oxygenData[0].length(); i++){
        Integer zeroes = 0;
        Integer ones = 0;
        String filterOn = '';
        // iterate over all instances left and count zeroes
        for(String byteString : oxygenData){
            if(byteString.substring(i, i+1) == '0'){
                zeroes ++;
            } else {
                ones++;
            }
        }
        if(zeroes == ones){
            filterOn = '1';
        } else if(zeroes > ones){
            filterOn = '0';
        } else {
            filterOn = '1';
        }
        for(Integer x = oxygenData.size()-1; x >= 0; x--){
            if(oxygenData[x].substring(i, i+1) != filterOn && oxygenData.size() > 1){
                oxygenData.remove(x);
            }
        }
    }
}
Integer oxygenResult = 0;
if(oxygenData[0] != null && oxygenData[0].containsOnly('01')) {
    oxygenResult = 0;
    for(String s: oxygenData[0].split('')) {
        oxygenResult = (oxygenResult << 1) | (s == '1'? 1 : 0);
    }
}

while(co2Data.size() > 1){
    // iterate over positions
    Integer oxygenHalfSize = co2Data.size() / 2;
    for(Integer i = 0; i < co2Data[0].length(); i++){
        Integer zeroes = 0;
        Integer ones = 0;
        String filterOn = '';
        // iterate over all instances left and count zeroes
        for(String byteString : co2Data){
            if(byteString.substring(i, i+1) == '0'){
                zeroes++;
            } else {
                ones++;
            }
        }
        if(zeroes == ones){
            filterOn = '0';
        } else if(zeroes > ones){
            filterOn = '1';
        } else {
            filterOn = '0';
        }
        for(Integer x = co2Data.size()-1; x >= 0; x--){
            if(co2Data[x].substring(i, i+1) != filterOn && co2Data.size() > 1){
                co2Data.remove(x);
            }
        }
    }
}
Integer CO2result = 0;
if(co2Data[0] != null && co2Data[0].containsOnly('01')) {
    CO2result = 0;
    for(String s: co2Data[0].split('')) {
        CO2result = (CO2result << 1) | (s == '1'? 1 : 0);
    }
}

System.debug(CO2result * oxygenResult);
