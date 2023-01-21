void main(List<String> args) {
  printBeerSong();
}

String getBottleWordForm(int quantity) {
  if (quantity > 1 || quantity == 0)
    return 'bottles';
  else
    return 'bottle';
}

void printBeerSong() {
  String bottleWordForm;
  int nextQuantity;
  int actualQuantity;

  for (var i = 99; i > 0; i--) {
    actualQuantity = i;
    nextQuantity = actualQuantity - 1;

    bottleWordForm = getBottleWordForm(actualQuantity);
    print(
        "$actualQuantity $bottleWordForm of beer on the wall, $i $bottleWordForm of beer");

    bottleWordForm = getBottleWordForm(nextQuantity);
    print(
        "Take one down and pass it around, $nextQuantity $bottleWordForm of beer on the wall\n");
  }

  print('No more bottles of beer on the wall, no more bottles of beer.');
  print('Go to the store and buy some more, 99 bottles of beer on the wall.');
}
