//Set<String> thermalInput = AOC_21_13_DataProvider.thermalInputTest;
//List<String> foldInput = AOC_21_13_DataProvider.foldInputTest;
Set<String> thermalInput = AOC_21_13_DataProvider.thermalInput;
List<String> foldInput = AOC_21_13_DataProvider.foldInput;


Set<String> foldedPaper = thermalInput;

for(String fold : foldInput){
    Set<String> foldInProgress = new Set<String>();
    String firstFoldDirection = fold.contains('x') ? 'x' : 'y';
    Integer firstFold = Integer.valueOf(fold.split('=')[1]);

    for(String input : foldedPaper) {
        Integer xPos = Integer.valueOf(input.split(',')[0]);
        Integer yPos = Integer.valueOf(input.split(',')[1]);
        if(firstFoldDirection == 'y'){
            if(yPos < firstFold) {
                foldInProgress.add(input);
                continue;
            } else if(yPos > firstFold) {

                yPos = (firstFold * 2) - yPos ;
                foldInProgress.add(xPos + ',' + yPos);
            }
        } else {
            if(xPos < firstFold) {
                foldInProgress.add(input);
                continue;
            } else if(xPos > firstFold) {
                xPos = (firstFold * 2) - xPos ;
                foldInProgress.add(xPos + ',' + yPos);
            }
        }
    }
    foldedPaper = foldInProgress;
}

List<List<String>> code = new List<List<String>>();
for(Integer y = 0; y <= 5  ; y++) {
    List<String> codeRow = new List<String>();
    for(Integer x = 0; x <= 38; x++) {
        if(foldedPaper.contains(x + ',' + y)){
            codeRow.add('#');
        } else {
            codeRow.add('.');
        }
    }
    System.debug(JSON.serialize(codeRow));
}