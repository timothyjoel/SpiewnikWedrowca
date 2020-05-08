//
//  LikedSongsViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class LikedSongsViewModel: ObservableObject {
    
    @Published var likedSongs = [Song]()
    
    init(likedSongs: [Song]) {
        self.likedSongs = likedSongs
    }
    
    func removeSong(at offsets: IndexSet) {
        likedSongs.remove(atOffsets: offsets)
    }
    
}
