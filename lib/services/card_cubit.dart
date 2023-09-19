import 'dart:developer';
import 'dart:io';

import 'package:ekzh/services/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

import 'entities/card_ekzh.dart';
// import 'package:medium_bloc_cache_project/home/home.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit({required CardRepository cardRepository})
      : _cardRepository = cardRepository,
        super(CardInitial());

  final CardRepository _cardRepository;
  Future<CardEkzh?> getCardByNumber(int cardNumber) async {
    return await _cardRepository.getCardByNumber(cardNumber);
  }

  Future<void> getCards() async {
    try {
      emit(CardLoading());
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        final serverResponse = await _cardRepository.getCards();

        await _cardRepository.saveCardsLocally(cards: serverResponse);

        emit(CardLoaded(response: serverResponse));
      } else {
        final localCards = await _cardRepository.fetchAllLocalCards();
        log(localCards.length);
        emit(CardLoaded(response: localCards));
      }
    } catch (e) {
      emit(CardError(error: e.toString()));
    }
  }

}
