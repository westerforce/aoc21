//List<List<Integer>> octoInput = AOC_21_11_DataProvider.octoInputTest;
List<List<Integer>> octoInput = AOC_21_11_DataProvider.octoInput;
Boolean syncedFlashes = false;
Integer step = 0;
while(!syncedFlashes){
    step++;
    Integer flashesInStep = 0;
    for(Integer row = 0; row < 10; row++) {
        for(Integer column = 0; column < 10; column++) {
            octoInput[row][column]++;
        }
    }

    // flashing?
    for(Integer row = 0; row < 10; row++) {
        for(Integer column = 0; column < 10; column++) {
            if(octoInput[row][column] > 9) {
                flashesInStep = flashing(row, column, flashesInStep);
            }
        }
    }
    if(flashesInStep == 100) {
        System.debug('SYNC IN STEP ' + step);
        syncedFlashes = true;
    }
}


Integer flashing(Integer row, Integer column, Integer flashesInStep){
    flashesInStep++;
    octoInput[row][column] = 0;

    Boolean checkAbove = true;
    Boolean checkAboveRight = true;
    Boolean checkAboveLeft = true;
    Boolean checkBelow = true;
    Boolean checkBelowRight = true;
    Boolean checkBelowLeft = true;
    Boolean checkRight = true;
    Boolean checkLeft = true;

    if(row == 0) {
        checkAbove = false;
        checkAboveLeft = false;
        checkAboveRight = false;
    } else if(row == octoInput.size() - 1) {
        checkBelow = false;
        checkBelowRight = false;
        checkBelowLeft = false;
    }

    if(column == 0){
        checkLeft = false;
        checkAboveLeft = false;
        checkBelowLeft = false;
    } else if(column == octoInput[0].size() -1) {
        checkRight = false;
        checkBelowRight = false;
        checkAboveRight = false;
    }

    if(checkAbove && octoInput[row-1][column] != 0) {
        octoInput[row-1][column]++;
        if(octoInput[row-1][column] > 9){
            flashesInStep = flashing(row-1, column, flashesInStep);
        }
    }

    if(checkAboveRight && octoInput[row-1][column+1] != 0) {
        octoInput[row-1][column+1]++;
        if(octoInput[row-1][column+1] > 9){
            flashesInStep = flashing(row-1, column+1, flashesInStep);
        }
    }

    if(checkAboveLeft && octoInput[row-1][column-1] != 0) {
        octoInput[row-1][column-1]++;
        if(octoInput[row-1][column-1] > 9){
            flashesInStep = flashing(row-1, column-1, flashesInStep);
        }
    }

    if(checkBelow && octoInput[row+1][column] != 0) {
        octoInput[row+1][column]++;
        if(octoInput[row+1][column] > 9){
            flashesInStep = flashing(row+1, column, flashesInStep);
        }
    }

    if(checkBelowRight && octoInput[row+1][column+1] != 0) {
        octoInput[row+1][column+1]++;
        if(octoInput[row+1][column+1] > 9){
            flashesInStep = flashing(row+1, column+1, flashesInStep);
        }
    }

    if(checkBelowLeft && octoInput[row+1][column-1] != 0) {
        octoInput[row+1][column-1]++;
        if(octoInput[row+1][column-1] > 9){
            flashesInStep = flashing(row+1, column-1, flashesInStep);
        }
    }

    if(checkLeft && octoInput[row][column-1] != 0) {
        octoInput[row][column-1]++;
        if(octoInput[row][column-1] > 9){
            flashesInStep = flashing(row, column-1, flashesInStep);
        }
    }

    if(checkRight && octoInput[row][column+1] != 0){
        octoInput[row][column+1]++;
        if(octoInput[row][column+1] > 9){
            flashesInStep = flashing(row, column+1, flashesInStep);
        }
    }
    return flashesInStep;
}