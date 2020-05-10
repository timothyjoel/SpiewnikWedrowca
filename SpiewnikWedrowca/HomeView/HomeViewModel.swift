//
//  HomeViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation
import Combine

enum HTTPError: LocalizedError {
    case statusCode
}

class HomeViewModel: ObservableObject {
    
    @Published var songs = [Song]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchSongs()
    }
    
    func fetchSongs() {
        songs.removeAll()
        let urlString = "https://raw.githubusercontent.com/timothyjoel/SpiewnikWedrowca/master/wedrowiec.json"
        guard let url = URL(string: urlString) else {
            return
        }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                return output.data
        }
        .receive(on: RunLoop.main)
        .decode(type: [Song].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }, receiveValue: { songs in
            self.songs = songs
                self.songs = songs
        })
    }
    
}
