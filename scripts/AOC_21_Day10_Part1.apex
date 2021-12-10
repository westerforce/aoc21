//List<String> navigationInput = AOC_21_10_DataProvider.navigationInputTest;
List<String> navigationInput = AOC_21_10_DataProvider.navigationInput;

Set<String> openingCharacters = new Set<String> {'(','{','<','['};
Set<String> closingCharacters = new Set<String> {')','}','>',']'};
Map<String, String> characterMatches = new Map<String, String> {
    '(' => ')',
    '{' => '}',
    '<' => '>',
    '[' => ']'
};
Map<String, Integer> scoring = new Map<String, Integer> {
    ')' => 3,
    '}' => 1197,
    '>' => 25137,
    ']' => 57
};

List<String> wrongCharacters = new List<String>();
for(Integer i = 0, e = navigationInput.size(); i < e; i++) {
    String sequence = navigationInput[i];
    List<String> openedCharacters = new List<String>();
    for(Integer s = 0, es = sequence.length(); s < es; s++) {
        String character = sequence.substring(s, s+1);
        if(openingCharacters.contains(character)) {
            openedCharacters.add(character);
        } else {
            if(characterMatches.get(openedCharacters[openedCharacters.size() - 1]) != character) {
                wrongCharacters.add(character);
                break;
            } else {
                openedCharacters.remove(openedCharacters.size() - 1);
            }
        }
    }
}

Integer total = 0;
for(String character : wrongCharacters) {
    total += scoring.get(character);
}
System.debug(total);