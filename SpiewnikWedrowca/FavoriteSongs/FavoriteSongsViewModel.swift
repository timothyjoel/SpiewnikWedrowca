//
//  FavoriteSongsViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class FavoriteSongsViewModel: ObservableObject {
    
    @Published var likedSongs = [Song]()
    
    init() {
        likedSongs = LikedSongsManager.shared.loadSongs()
    }
    
    func removeSong(at offsets: IndexSet) {
        likedSongs.remove(atOffsets: offsets)
    }
    
}
