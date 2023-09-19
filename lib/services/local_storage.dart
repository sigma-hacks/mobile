import 'dart:developer';

import 'package:ekzh/services/entities/pending_request.dart';
import 'package:ekzh/services/entities/tariff.dart';
import 'package:ekzh/services/https_service.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'entities/card_ekzh.dart';
// import 'package:hive/hive.dart';

// class LocalStorage {

Future<CardRepository> initialiseHive() async {
  //key
  const cardKey = 'cards';
  //adapters
  Hive.registerAdapter(CardAdapter());
  Hive.registerAdapter(TariffAdapter());

  //box
  final cardsBox = await Hive.openLazyBox<CardEkzh?>(cardKey);
  //repos
  return CardRepository(cardBox: cardsBox);
}

// }

class CardRepository {
  CardRepository({required LazyBox<CardEkzh?> cardBox}) : _cardBox = cardBox;

  final _httpsService = HttpsService();

  final LazyBox<CardEkzh?> _cardBox;

  Future<List<CardEkzh>> getCards() async {
    log('Начали грузить карты');
    final response = await _httpsService.getRegistr(lastUpdate: DateTime.now());

    log('Загрузили, количество ${response.registers.length}');
    final cards = response.registers
        .map(
            ((e) => CardEkzh.fromRegister(e, response.names, response.tariffs)))
        .toList();

    return cards;
  }

  Future<void> saveCardsLocally({
    required List<CardEkzh> cards,
  }) async {
    for (final card in cards) {
      await _cardBox.put(card.cardNumber.hashCode, card);
    }
  }

  Future<CardEkzh?> getCardByNumber(int cardNumber) async {
    return await _cardBox.get(cardNumber.hashCode);
  }

  Future fetchAllLocalCards() async {
    final count = _cardBox.keys.length;
    log('Количество ключей $count');
    // final localCards = _cardBox.values.toList();
    // return localCards;
  }
}
