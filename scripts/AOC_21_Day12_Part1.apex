List<List<String>> input = AOC_21_12_DataProvider.caveInput;
//List<List<String>> input = AOC_21_12_DataProvider.caveInputTest;
Map<String, List<String>> caveMap = new Map<String, List<String>>();

for(List<String> inputRow : input) {
    String origin = inputRow[0];
    String target = inputRow[1];
    if(!caveMap.containsKey(origin)) {
        caveMap.put(origin, new List<String> {target});
    } else {
        caveMap.get(origin).add(target);
    }

    if(!caveMap.containsKey(target)) {
        caveMap.put(target, new List<String> {origin});
    } else {
        caveMap.get(target).add(origin);
    }
}

List<List<String>> toExplore = new List<List<String>> {
    new List<String> {'start'}
};

List<List<String>> paths = new List<List<String>>();


while(toExplore.size() > 0) {
    List<String> currPath = toExplore[toExplore.size() - 1];
    toExplore.remove(toExplore.size() - 1);
    
    String currLastPlace = currPath[currPath.size() - 1];

    if(currLastPlace == 'end') {
        paths.add(currPath);
        continue;
    }
    
    for(String neighbour : caveMap.get(currLastPlace)) {
        if(neighbour == 'start') {
            continue;
        }
        if(!neighbour.isAllUpperCase() && currPath.contains(neighbour)) {
            continue;
        }
        List<String> toAddToExplore = new List<String>();
        toAddToExplore.addAll(currPath);
        toAddToExplore.add(neighbour);
        toExplore.add(toAddToExplore);
    }
}

System.debug(paths.size());
