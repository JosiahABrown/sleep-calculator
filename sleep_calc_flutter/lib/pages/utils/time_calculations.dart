class TimeCalc {
  static List<DateTime> calculateWakeUpTimes(DateTime bedTime) {
    List<DateTime> wakeUpTimes = [];
    wakeUpTimes.add(bedTime.add(Duration(hours: 6, minutes: 15)));
    wakeUpTimes.add(bedTime.add(Duration(hours: 7, minutes: 45)));
    wakeUpTimes.add(bedTime.add(Duration(hours: 9, minutes: 15)));
    return wakeUpTimes;
  }

  static List<DateTime> calculateBedTimes(DateTime wakeUpTime) {
    List<DateTime> bedTimes = [];
    bedTimes.add(wakeUpTime.subtract(Duration(hours: 6, minutes: 15)));
    bedTimes.add(wakeUpTime.subtract(Duration(hours: 7, minutes: 45)));
    bedTimes.add(wakeUpTime.subtract(Duration(hours: 9, minutes: 15)));
    return bedTimes;
  }
}