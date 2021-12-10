//List<String> navigationInput = AOC_21_10_DataProvider.navigationInputTest;
List<String> navigationInput = AOC_21_10_DataProvider.navigationInput;

Set<String> openingCharacters = new Set<String> {'(','{','<','['};
Map<String, String> characterMatches = new Map<String, String> {
    '(' => ')',
    '{' => '}',
    '<' => '>',
    '[' => ']'
};
Map<String, Integer> scoring = new Map<String, Integer> {
    ')' => 1,
    '}' => 3,
    '>' => 4,
    ']' => 2
};
List<Long> allScores = new List<Long>();
List<String> wrongCharacters = new List<String>();
for(Integer i = 0, e = navigationInput.size(); i < e; i++) {
    String sequence = navigationInput[i];
    List<String> openedCharacters = new List<String>();
    Boolean continueAfterWrong = false;
    for(Integer s = 0, es = sequence.length(); s < es; s++) {
        String character = sequence.substring(s, s+1);
        if(openingCharacters.contains(character)) {
            openedCharacters.add(character);
        } else {
            if(characterMatches.get(openedCharacters[openedCharacters.size() - 1]) != character) {
                wrongCharacters.add(character);
                continueAfterWrong = true;
                break;
            } else {
                openedCharacters.remove(openedCharacters.size() - 1);
            }
        }
    }
    if(continueAfterWrong) continue;
    Long sequenceScore = 0;
    for(Integer x = 0, y = openedCharacters.size(); x < y; x++) {
        sequenceScore *= 5;
        sequenceScore += scoring.get(characterMatches.get(openedCharacters[openedCharacters.size() - x - 1]));
    }
    allScores.add(sequenceScore);
}
allScores.sort();
System.debug(allScores[(allScores.size() - 1) / 2]);
