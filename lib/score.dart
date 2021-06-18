
class Score {
  int value;
  int maxValue;

  Score({this.value = 0, this.maxValue = 0});

  void increase(bool scored) {
    if (scored)
      value++;
    maxValue++;
  }
}
