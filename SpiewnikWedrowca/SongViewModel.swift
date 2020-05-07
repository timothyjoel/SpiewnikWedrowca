//
//  SongViewModel.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

fileprivate struct SongPart {
    var title: String
    var text: String
}

class SongViewModel: ObservableObject {
    
    var song: Song
    
    init(_ song: Song) {
        self.song = song
    }
    
    func formattedSongLyrics() -> String {
        var lyrics = song.lyrics
        lyrics = lyrics?.replacingOccurrences(of: "\n ", with: "\n")
        return lyrics ?? ""
    }
    
    func formattedTitle() -> String {
        return String(song.number) + ". \(song.title)"
    }
    
}
