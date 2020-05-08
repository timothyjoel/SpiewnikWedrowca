//
//  DatabaseManager.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 08/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum LikedSongsAction {
    case add, remove
}

class LikedSongsManager {
    
    static let shared = LikedSongsManager()
    
    private init() {}
    
    func loadSongs() -> [Song] {
        var songs = [Song]()
        if let data = UserDefaults.standard.value(forKey:"favoriteSongs") as? Data {
            do {
                songs = try PropertyListDecoder().decode(Array<Song>.self, from: data)
            } catch {
                print(error)
            }
        }
        return songs
    }
    
    func manage(_ action: LikedSongsAction, _ song: Song) {
        var songs = loadSongs()
        switch action {
        case .add:
            if !songs.contains(song) {
                songs.append(song)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(songs), forKey: "favoriteSongs")
                print("ADDED TO LIKED: \(song)")
            }
        case .remove:
            if songs.contains(song) {
                songs = songs.filter { $0 != song }
                UserDefaults.standard.set(try? PropertyListEncoder().encode(songs), forKey: "favoriteSongs")
                print("REMOVED FROM LIKED: \(song)")
            }
        }
        
    }
    
}
