//List<String> navigationData = AOC_21_02_DataProvider.navigationTest;
List<String> navigationData = AOC_21_02_DataProvider.navigation;

Integer distance = 0;
Integer depth = 0;
Integer aim = 0;
for(String navigationSpecs : navigationData) {
    List<String> instruction = navigationSpecs.split(' ');
    String direction = instruction[0];
    Integer value = Integer.valueOf(instruction[1]);
    if(instruction[0] == 'forward') {
        distance += value;
        depth += aim * value;
    } else if(instruction[0] == 'down') {
        aim += value;
    } else {
        aim -= value;
    }
}
System.debug(distance * depth);