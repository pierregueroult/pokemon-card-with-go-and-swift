//
//  CardView.swift
//  tcg-collector
//
//  Created by Pierre Guéroult on 01/11/2024.
//

import SwiftUI

public struct CardView: View {
    @State var errorMessage: String = ""
    @State var cards: [Card] = []

    @State private var selectedCard: Card? = nil
    @State private var isShowingDetail = false

    let cardSet: Set

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    public var body: some View {
        VStack {
            NavigationView {
                if cards.isEmpty {
                    ProgressView("Loading cards ...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            loadCards(page: 1, quantity: 250)
                        }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(cards, id: \.id) { card in
                                VStack {
                                    AsyncImage(
                                        url: URL(string: card.images.small),
                                        content: { image in
                                            image.resizable()
                                                .aspectRatio(63 / 88, contentMode: .fit)
                                                .onTapGesture {
                                                    selectedCard = card
                                                    isShowingDetail = true
                                                }
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }

                                    )
                                }
                            }
                        }
                        .padding(16)
                    }
                    .sheet(isPresented: $isShowingDetail) {
                        CardDetailView(card: $selectedCard, isShowing: $isShowingDetail)
                    }
                }
            }
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }

    func loadCards(page: Int, quantity: Int) {
        guard
            let url = URL(
                string: "http://localhost:8080/api/cards/by/set?page=1&quantity=250&set="
                    + cardSet.id)
        else {
            errorMessage = "Invalid URL"
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }

            let decoder = JSONDecoder()
            do {
                let fetchedCards = try decoder.decode(CardResponse.self, from: data)
                DispatchQueue.main.async {
                    self.cards = fetchedCards.data
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
