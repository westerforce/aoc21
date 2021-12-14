//String templateString = AOC_21_14_DataProvider.templateTest;
//Map<String, String> pairs = AOC_21_14_DataProvider.pairsTest;
String templateString = AOC_21_14_DataProvider.template;
Map<String, String> pairs = AOC_21_14_DataProvider.pairs;

Map<String, Long> characterCount = new Map<String, Long>();
Map<String, Long> pairCount = new Map<String, Long>();

void count(Map<String, Long> mapping, String character, Long addition){
    if(mapping.containsKey(character)){
        mapping.put(character, mapping.get(character) + addition);
    } else {
        mapping.put(character, addition);
    }
}

List<String> template = templateString.split('');
System.debug(templateString);
for(Integer l = 0; l < template.size() - 1; l++){
    String pair = template[l] + template[l + 1];
    count(pairCount, pair, 1);
    count(characterCount, template[l], 1);
}
count(characterCount, template[template.size() - 1], 1);

for(Integer i = 0; i < 10; i++) {
    Map<String, Long> tempCount = new Map<String, Long>();
    for(String pair : pairCount.keySet()){
        Long instances = pairCount.get(pair);
        String left = pair.substring(0, 1);
        String right = pair.substring(1, 2);
        
        String insertCharacter = pairs.get(pair);
        String newPairLeft = left + insertCharacter;
        String newPairRight = insertCharacter + right;
        count(tempCount, newPairLeft, instances);
        count(tempCount, newPairRight, instances);
        count(characterCount, insertCharacter, instances);
    }
    pairCount = tempCount;
}
System.debug(JSON.serializePretty(characterCount));
Long min = characterCount.values()[0];
Long max = characterCount.values()[0];
for(Long value : characterCount.values()) {
    if(value < min) { min = value; }
    if(value > max) { max = value; }
}
System.debug(max - min);


