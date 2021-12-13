public with sharing class AOC_21_12_DataProvider {

    @Future
    public static void goSearch(Boolean testContext) {
        List<List<String>> input = new List<List<String>>();
        if(testContext){
            input = AOC_21_12_DataProvider.caveInputTest;
        } else {
            input = AOC_21_12_DataProvider.caveInput;
        }

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
                List<String> toAddToExplore = new List<String>();
                toAddToExplore.addAll(currPath);
                toAddToExplore.add(neighbour);
                if(isValidPath(toAddToExplore)) {
                    toExplore.add(toAddToExplore);
                }
            }
        }
        System.debug(paths.size());
    }

    public static Boolean isValidPath(List<String> path) {
        Integer howManyDuplicates = 0;
        List<String> sortedPath = new List<String>();
        for(String p : path) {
            if(p != 'start' && p != 'end' && !p.isAllUpperCase()){
                sortedPath.add(p);
            }
        }
        sortedPath.sort();
        if(sortedPath.size() <= 2){
            return true;
        }
        for(Integer i = 1; i < sortedPath.size(); i++) {
            if(sortedPath[i - 1] == sortedPath[i]) {
                howManyDuplicates++;
            }
        }
        return howManyDuplicates <= 1;
    }

    public static List<List<String>> caveInputTest = new List<List<String>> {
        new List<String> {'start','A'},
        new List<String> {'start','b'},
        new List<String> {'A','c'},
        new List<String> {'A','b'},
        new List<String> {'b','d'},
        new List<String> {'A','end'},
        new List<String> {'b','end'}
    };

    public static List<List<String>> caveInput = new List<List<String>> {
        new List<String> {'yb','pi'},
        new List<String> {'jg','ej'},
        new List<String> {'yb','KN'},
        new List<String> {'LD','start'},
        new List<String> {'end','UF'},
        new List<String> {'UF','yb'},
        new List<String> {'yb','xd'},
        new List<String> {'qx','yb'},
        new List<String> {'xd','end'},
        new List<String> {'jg','KN'},
        new List<String> {'start','qx'},
        new List<String> {'start','ej'},
        new List<String> {'qx','LD'},
        new List<String> {'jg','LD'},
        new List<String> {'xd','LD'},
        new List<String> {'ej','qx'},
        new List<String> {'end','KN'},
        new List<String> {'DM','xd'},
        new List<String> {'jg','yb'},
        new List<String> {'ej','LD'},
        new List<String> {'qx','UF'},
        new List<String> {'UF','jg'},
        new List<String> {'qx','jg'},
        new List<String> {'xd','UF'}
    };
}