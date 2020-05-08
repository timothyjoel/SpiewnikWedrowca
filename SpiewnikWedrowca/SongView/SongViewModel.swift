//
//  SongViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct SongPart: Hashable {
    var title: String
    var text: String
}

class SongViewModel: ObservableObject {
    
    var song: Song
    
    init(_ song: Song) {
        self.song = song
    }
    
    var songParts: [SongPart] {
        var parts = [SongPart]()
        let array = formattedSongLyrics().components(separatedBy: "\n\n")
        var songPart = 0
        for _ in 0..<array.count - 1 {
            if songPart < array.count {
                parts.append(SongPart(title: array[songPart], text: array[songPart+1]))
                songPart += 2
            }
        }
        return parts
    }
    
    private func formattedSongLyrics() -> String {
        var lyrics = song.lyrics
        lyrics = lyrics.replacingOccurrences(of: "\n ", with: "\n")
        return lyrics
    }
    
    func formattedTitle() -> String {
        return String(song.number) + ". \(song.title)"
    }
    
    var isLiked: Bool {
        return LikedSongsManager.shared.loadSongs().contains(song)
    }
    
    func like() {
        LikedSongsManager.shared.manage(.add, song)
    }
    
    func unlike() {
        LikedSongsManager.shared.manage(.remove, song)
    }
    
}
