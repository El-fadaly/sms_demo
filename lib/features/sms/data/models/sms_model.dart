class SmsModel{
  String smsSender;
  DateTime dateTime;
  double moneyAmount;
  String body;
  bool isSelected ;

  SmsModel({
    required this.smsSender,
    required this.dateTime,
    required this.moneyAmount,
    required this.body,
    required this.isSelected, 
});
}