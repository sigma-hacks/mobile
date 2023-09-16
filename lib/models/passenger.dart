import 'card_type.dart';
import 'tariff.dart';

class Passenger {
  final String name;
  final Tariff tariff;
  final String cardNumber;
  final CardType cardType;

  Passenger({
    required this.name,
    required this.tariff,
    required this.cardNumber,
    required this.cardType,
  });
}
