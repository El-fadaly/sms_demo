class FetchingDoubles{
  /// int is for the index of the price in stringList which is the parsed SMS
  /// to check if this the number is for the balance or not

  static Map<int,double> fetch(List<String> stringList){
    final doubleMap = <int,double>{};
    for (var index=0; index< stringList.length ; index++) {
      final isANumber = num.tryParse(stringList[index]);
      if(isANumber != null && isANumber.runtimeType == double){
        doubleMap.putIfAbsent(index, () => isANumber as double);
      }
    }
    return doubleMap;
  }
}