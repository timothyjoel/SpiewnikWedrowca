//
//  FavoriteSongsViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class FavoriteSongsViewModel: ObservableObject {
    
    @Published var favoriteSongs = [Song]()
    
    init() {
        loadFavoriteSongs()
    }
    
    func loadFavoriteSongs() {
        if let data = UserDefaults.standard.value(forKey:"favoriteSongs") as? Data {
            do {
                favoriteSongs = try PropertyListDecoder().decode(Array<Song>.self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func saveFavoriteSongs() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(favoriteSongs), forKey: "favoriteSongs")
    }
    
    
}
