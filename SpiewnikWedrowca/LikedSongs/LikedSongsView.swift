//
//  LikedSongsView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct LikedSongsView: View {
    
    @ObservedObject var sm: SongsManager
    
    var body: some View {
        List {
            ForEach(sm.likedSongs, id: \.self) { song in
                HStack {
                    Text("\(song.number).")
                    Text(song.title)
                }
            }
            .onDelete(perform: sm.removeSong)
        }
        .navigationBarTitle(Text("Ulubione pieśni"))
    }

}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedSongsView(sm: SongsManager())
    }
}
