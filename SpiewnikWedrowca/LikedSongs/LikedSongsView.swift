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
    @State var showDeleteConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
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
                .blur(radius: self.showDeleteConfirmation ? 10 : 0)
                .onAppear(perform: {
                    self.db.loadSongs()
                })
                    .navigationBarTitle(Text("Ulubione pieśni"))
                    .blur(radius: self.showDeleteConfirmation ? 10 : 0)
                    .navigationBarItems(trailing:
                        Button(action: {
                            if !self.db.likedSongs.isEmpty {
                                self.showDeleteConfirmation.toggle()
                            }
                        }, label: {
                            Icon(image: .trash, size: .medium, weight: .semibold, color: .main)
                            .opacity(self.db.likedSongs.isEmpty ? 0.0 : 1.0)
                        })
                )
            }
            SingleActionPopup(showView: $showDeleteConfirmation, icon: .trash, message: "Czy na pewno chcesz usunąć wszystkie polubione pieśni?", buttonTitle: "Akceptuj") {
                self.db.removeAll()
                self.showDeleteConfirmation.toggle()
            }
            .scaleEffect(self.showDeleteConfirmation ? 1.0 : 0.5)
            .opacity(self.showDeleteConfirmation ? 1.0 : 0.0)
            .animation(.spring())
        }
    }
    
}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedSongsView(db: DatabaseManager())
    }
}
