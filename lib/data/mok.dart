import '../models/card_type.dart';
import '../models/passenger.dart';
import '../models/tariff.dart';

final Passenger passenger = Passenger(
  name: 'Иванов В.П.',
  tariff: const Tariff(name: 'Школьный', sale: 49),
  cardNumber: '2202-10**-****-3325',
  cardType: CardType.bank,
);
