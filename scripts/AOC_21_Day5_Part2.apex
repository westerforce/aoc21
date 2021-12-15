//List<String> coordinateStrings = AOC_21_05_DataProvider.coordinatesTest;
List<String> coordinateStrings = AOC_21_05_DataProvider.coordinates;
List<AOC_21_05_DataProvider.Coordinate> coordinates= new List<AOC_21_05_DataProvider.Coordinate>();
for(String coordinateString : coordinateStrings){
    coordinates.add(new AOC_21_05_DataProvider.Coordinate(coordinateString.replace(' -> ', ',').split(',')));
}

List<AOC_21_05_DataProvider.Coordinate> realCoordinates = new List<AOC_21_05_DataProvider.Coordinate>();
for(AOC_21_05_DataProvider.Coordinate coordinate : coordinates) {
    if(coordinate.x1 == coordinate.x2 || coordinate.y1 == coordinate.y2){
        realCoordinates.add(coordinate);
    } else if(Math.abs(coordinate.x1 - coordinate.x2) == Math.abs(coordinate.y1 - coordinate.y2)){
        realCoordinates.add(coordinate);
    }
}

Map<String, Integer> coordinateCounter = new Map<String, Integer>();
for(AOC_21_05_DataProvider.Coordinate coordinate : realCoordinates){
    if(coordinate.x1 == coordinate.x2){
        if(coordinate.y1 == coordinate.y2){
            String key = coordinate.x1 + '.' + coordinate.y2;
            if(coordinateCounter.containsKey(key)){
                coordinateCounter.put(key, coordinateCounter.get(key) + 1);
            } else {
                coordinateCounter.put(key, 1);
            }
        }
        if(coordinate.y1 > coordinate.y2){
            for(Integer y = coordinate.y2; y <= coordinate.y1; y++){
                String key = coordinate.x1 + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
            }
        }
        if(coordinate.y1 < coordinate.y2){
            for(Integer y = coordinate.y1; y <= coordinate.y2; y++){
                String key = coordinate.x1 + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
            }
        }
    } else if(coordinate.y1 == coordinate.y2){
        if(coordinate.x1 == coordinate.x2){
            String key = coordinate.x1 + '.' + coordinate.y1;
            if(coordinateCounter.containsKey(key)){
                coordinateCounter.put(key, coordinateCounter.get(key) + 1);
            } else {
                coordinateCounter.put(key, 1);
            }
        }
        if(coordinate.x1 > coordinate.x2){
            for(Integer x = coordinate.x2; x <= coordinate.x1; x++){
                String key = x + '.' + coordinate.y1;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
            }
        }
        if(coordinate.x1 < coordinate.x2){
            for(Integer x = coordinate.x1; x <= coordinate.x2; x++){
                String key = x + '.' + coordinate.y1;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
            }
        }
    } else if(Math.abs(coordinate.x1 - coordinate.x2) == Math.abs(coordinate.y1 - coordinate.y2)){
        if(coordinate.x1 > coordinate.x2 && coordinate.y1 > coordinate.y2){
            for(Integer x = coordinate.x1, y = coordinate.y1; x >= coordinate.x2; x--){
                String key = x + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
                y--;
            }
        } else if(coordinate.x1 < coordinate.x2 && coordinate.y1 > coordinate.y2){
            for(Integer x = coordinate.x1, y = coordinate.y1; x <= coordinate.x2; x++){
                String key = x + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
                y--;
            }
        } else if(coordinate.x1 > coordinate.x2 && coordinate.y1 < coordinate.y2){
            for(Integer x = coordinate.x1, y = coordinate.y1; x >= coordinate.x2; x--){
                String key = x + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
                y++;
            }
        } else if(coordinate.x1 < coordinate.x2 && coordinate.y1 < coordinate.y2){
            for(Integer x = coordinate.x1, y = coordinate.y1; x <= coordinate.x2; x++){
                String key = x + '.' + y;
                if(coordinateCounter.containsKey(key)){
                    coordinateCounter.put(key, coordinateCounter.get(key) + 1);
                } else {
                    coordinateCounter.put(key, 1);
                }
                y++;
            }
        }
    }
}
Integer counter = 0;
for(Integer highPoint : coordinateCounter.values()){
    if(highPoint >= 2){
        counter++;
    }
}
System.debug(counter);