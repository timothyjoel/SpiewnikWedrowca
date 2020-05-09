//
//  DatabaseManager.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 08/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class DatabaseManager: ObservableObject {

    @Published var likedSongs = [Song]()
    
    init() {
        loadSongs()
    }
    
    func loadSongs() {
        if let data = UserDefaults.standard.value(forKey: "likedSongs") as? Data {
            do {
                likedSongs = try PropertyListDecoder().decode(Array<Song>.self, from: data)
                likedSongs.sort { $0.number < $1.number }
            } catch {
                print(error)
            }
        }
    }
    
    func saveSongs() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(likedSongs), forKey: "likedSongs")
    }
    
    func add(_ song: Song) {
        if !likedSongs.contains(song) {
             likedSongs.append(song)
             saveSongs()
         }
    }
    
    func remove(_ song: Song) {
        if likedSongs.contains(song) {
             likedSongs = likedSongs.filter { $0 != song }
             saveSongs()
         }
    }
    
    func removeSong(at offsets: IndexSet) {
        likedSongs.remove(atOffsets: offsets)
        saveSongs()
    }
    
    func removeAll() {
        likedSongs.removeAll()
    }
    
    func isLiked(_ song: Song) -> Bool {
        return likedSongs.contains(song)
    }
    
}
