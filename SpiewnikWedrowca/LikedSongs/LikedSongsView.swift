//
//  LikedSongsView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 07/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct LikedSongsView: View {
    
    @ObservedObject var db: DatabaseManager
    
    var body: some View {
        List {
            ForEach(db.likedSongs, id: \.self) { song in
                NavigationLink(destination: SongView(song, self.db)) {
                    HStack {
                        Text("\(song.number).")
                        Text(song.title)
                    }
                }
            }
            .onDelete(perform: db.removeSong)
        }
        .onAppear(perform: {
            self.db.loadSongs()
        })
        .navigationBarTitle(Text("Ulubione pieśni"))
        .navigationBarItems(trailing:
            Button(action: {
                self.db.removeAll()
            }, label: {
                Icon(image: .trash, size: .medium, weight: .semibold, color: .main)
            })
        )
    }

}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedSongsView(db: DatabaseManager())
    }
}
