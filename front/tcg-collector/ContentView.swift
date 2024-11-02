import SwiftUI
import Foundation

struct ContentView: View {
    @State private var cardSets: [Set] = []
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            NavigationView {
                List(cardSets, id: \.id) { cardSet in
                    NavigationLink(destination: CardView(cardSet: cardSet)) {
                        HStack() {
                            VStack(alignment: .leading) {
                                Text(cardSet.name)
                                    .font(.headline)
                                Text(cardSet.releaseDate)
                                    .font(.subheadline)
                            }
                            Spacer()
                            AsyncImage(
                                url: URL(string: cardSet.images.symbol),
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(width: 30, height: 30)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                    }
                }
                .onAppear {
                    loadSet()
                }
            }
            Text(errorMessage)
        }
    }
    
    func loadSet() {
        guard let url = URL(string: "http://localhost:8080/api/sets?page=1&quantity=250") else {
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
                let cardSets = try decoder.decode(SetResponse.self, from: data)
                DispatchQueue.main.async {
                    self.cardSets = cardSets.data
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error decoding data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
