//
//  CardListViewModel.swift
//  Quizlet-ish
//

import Combine

class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
    @Published var cardViewModels: [CardViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$cards.map { cards in
            cards.map(CardViewModel.init)
        }
        .assign(to: \.cardViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func add(_ card: Card) {
        cardRepository.add(card)
    }
    
}
