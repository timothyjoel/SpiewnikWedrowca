//
//  DatabaseManager.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 08/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class SongsManager: ObservableObject {

    @Published var likedSongs = [Song]()
    
    init() {
        loadSongs()
    }
    
    func loadSongs() {
        if let data = UserDefaults.standard.value(forKey: "likedSongs") as? Data {
            do {
                likedSongs = try PropertyListDecoder().decode(Array<Song>.self, from: data)
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
             print("ADDED TO LIKED: \(song.number)")
             print(likedSongs)
         }
    }
    
    func remove(_ song: Song) {
        if likedSongs.contains(song) {
             likedSongs = likedSongs.filter { $0 != song }
             saveSongs()
             print("REMOVED FROM LIKED: \(song.number)")
             print(likedSongs)
         }
    }
    
    func removeSong(at offsets: IndexSet) {
        likedSongs.remove(atOffsets: offsets)
        saveSongs()
    }
    
}
