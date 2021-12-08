List<String> digitOutput = AOC_21_08_DataProvider.digitOutput;
//List<String> digitOutput = AOC_21_08_DataProvider.digitOutputTest;

Integer counter = 0;
for(String digit : digitOutput) {
    for(String digitCombis : digit.split('\\|')[1].split(' ')){
        if(digitCombis.trim().length() == 2 || digitCombis.length() == 3 || digitCombis.length() == 4 || digitCombis.length() == 7){
            counter++;
        }
    }
}
System.debug(counter);

