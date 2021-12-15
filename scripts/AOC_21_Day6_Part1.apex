List<Integer> lanternFish = AOC_21_06_DataProvider.lanternFishTest;
//List<Integer> lanternFish = AOC_21_06_DataProvider.lanternFish;
Integer numberOfDays = 80;

List<Long> fishPopulation = new List<Long>{0,0,0,0,0,0,0,0,0};
for(Integer i : lanternFish){
    fishPopulation[i + 1]++;
}

for(Integer i = 1; i <= numberOfDays + 1; i++){
    Long newFish = fishPopulation[0];
    fishPopulation.remove(0);
    fishPopulation[6] += newFish;
    fishPopulation.add(newFish);
}

Long totalFish = 0;
for(Long i : fishPopulation){
    totalFish += i;
}

System.debug(totalFish);