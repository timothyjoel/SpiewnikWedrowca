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
    
    var sm: SongsManager
    var song: Song
    
    init(_ song: Song, _ sm: SongsManager) {
        self.song = song
        self.sm = sm
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
    
    var title: String {
        return String(song.number) + ". \(song.title)"
    }
    
    var isLiked: Bool {
        return sm.likedSongs.contains(song)
    }
    
    func like() {
        sm.add(song)
    }
    
    func unlike() {
        sm.remove(song)
    }
    
}
