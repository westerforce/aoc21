List<String> digitOutput = AOC_21_08_DataProvider.digitOutput;
//List<String> digitOutput = AOC_21_08_DataProvider.digitOutputTest;

List<String> outputResults = new List<String>();
for(String digit : digitOutput) {
    Map<Integer, String> charMapping = new Map<Integer, String>();
    Map<String, Integer> digitMapping = new Map<String, Integer>();
    List<String> orderedOutputList = new List<String>();
    List<String> orderedInputList = new List<String>();
    List<String> digitInputChars = digit.split('\\|')[0].split(' ');
    List<String> digitOutputChars = digit.split('\\|')[1].split(' ');
    digitOutputChars.remove(0);

    for(String digitCombis : digitOutputChars) {
        String orderedOutput = '';
        if(digitCombis.contains('a')) orderedOutput += 'a';
        if(digitCombis.contains('b')) orderedOutput += 'b';
        if(digitCombis.contains('c')) orderedOutput += 'c';
        if(digitCombis.contains('d')) orderedOutput += 'd';
        if(digitCombis.contains('e')) orderedOutput += 'e';
        if(digitCombis.contains('f')) orderedOutput += 'f';
        if(digitCombis.contains('g')) orderedOutput += 'g';
        orderedOutputList.add(orderedOutput);
    }

    for(String digitCombis : digitInputChars) {
        String orderedInput = '';
        if(digitCombis.contains('a')) orderedInput += 'a';
        if(digitCombis.contains('b')) orderedInput += 'b';
        if(digitCombis.contains('c')) orderedInput += 'c';
        if(digitCombis.contains('d')) orderedInput += 'd';
        if(digitCombis.contains('e')) orderedInput += 'e';
        if(digitCombis.contains('f')) orderedInput += 'f';
        if(digitCombis.contains('g')) orderedInput += 'g';
        orderedInputList.add(orderedInput);
    }

    for(String digitCombis : orderedOutputList){
        // Get known numbers
        if(digitCombis.length() == 2){
            charMapping.put(1, digitCombis);
            digitMapping.put(digitCombis, 1);
        } else if(digitCombis.length() == 3){
            charMapping.put(7, digitCombis);
            digitMapping.put(digitCombis, 7);
        } else if(digitCombis.length() == 4){
            charMapping.put(4, digitCombis);
            digitMapping.put(digitCombis, 4);
        } else if(digitCombis.length() == 7){
            charMapping.put(8, digitCombis);
            digitMapping.put(digitCombis, 8);
        }
    }

    for(String digitCombis : orderedInputList){
        // Get known numbers
        if(digitCombis.length() == 2){
            charMapping.put(1, digitCombis);
            digitMapping.put(digitCombis, 1);
        } else if(digitCombis.length() == 3){
            charMapping.put(7, digitCombis);
            digitMapping.put(digitCombis, 7);
        } else if(digitCombis.length() == 4){
            charMapping.put(4, digitCombis);
            digitMapping.put(digitCombis, 4);
        } else if(digitCombis.length() == 7){
            charMapping.put(8, digitCombis);
            digitMapping.put(digitCombis, 8);
        }
    }

    List<String> allInputDigits = orderedInputList;
    allInputDigits.addAll(orderedOutputList);


    for(String currentDigit : allInputDigits) {
        if(currentDigit.length() == 5){
            String one = charMapping.get(1);
            String digitManipulation = currentDigit;
            digitManipulation = digitManipulation.remove(one.substring(0,1));
            digitManipulation = digitManipulation.remove(one.substring(1,2));
            if(digitManipulation.length() == 3){
                charMapping.put(3, currentDigit);
                digitMapping.put(currentDigit, 3);
            } else {
                String four = charMapping.get(4);
                String digitMan2 = currentDigit;
                digitMan2 = digitMan2.remove(four.substring(0,1));
                digitMan2 = digitMan2.remove(four.substring(1,2));
                digitMan2 = digitMan2.remove(four.substring(2,3));
                digitMan2 = digitMan2.remove(four.substring(3,4));
                if(digitMan2.length() == 3){
                    charMapping.put(2, currentDigit);
                    digitMapping.put(currentDigit, 2);
                } else {
                    charMapping.put(5, currentDigit);
                    digitMapping.put(currentDigit, 5);
                }
            }
        }

        if(currentDigit.length() == 6){
            String four = charMapping.get(4);
            String digitMan1 = currentDigit;
            digitMan1 = digitMan1.remove(four.substring(0,1));
            digitMan1 = digitMan1.remove(four.substring(1,2));
            digitMan1 = digitMan1.remove(four.substring(2,3));
            digitMan1 = digitMan1.remove(four.substring(3,4));
            if(digitMan1.length() == 2){
                charMapping.put(9, currentDigit);
                digitMapping.put(currentDigit, 9);
            } else {
                String one = charMapping.get(1);
                String digitMan2 = currentDigit;
                digitMan2 = digitMan2.remove(one.substring(0,1));
                digitMan2 = digitMan2.remove(one.substring(1,2));
                if(digitMan2.length() == 4){
                    charMapping.put(0, currentDigit);
                    digitMapping.put(currentDigit, 0);
                } else {
                    charMapping.put(6, currentDigit);
                    digitMapping.put(currentDigit, 6);
                }
            }
        }
    }

    String outputResult = '';
    for(String d : orderedOutputList){
        outputResult += digitMapping.get(d);
    }
    outputResults.add(outputResult);
}

Integer total = 0;
for(String s : outputResults){
    total += Integer.valueOf(s);
}
System.debug(total);

