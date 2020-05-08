//
//  SongView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Lottie

struct SongView: View {

    @ObservedObject var db: DatabaseManager
    var vm: SongViewModel
    
    @State var isLiked: Bool = false
    @State var shouldAnimate: Bool = false
    
    init(_ song: Song, _ db: DatabaseManager) {
        self.vm = SongViewModel(song)
        self.db = db
    }
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Text(vm.title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    ForEach(self.vm.songParts, id: \.self) { (song) in
                        VStack (alignment: .leading, spacing: 16) {
                            Text(song.title)
                                .font(.system(size: 17, weight: .bold, design: .default))
                            Text(song.text)
                                .font(.system(size: 17, weight: .regular, design: .default))
                                .lineSpacing(6)
                        }
                        
                    }
                    
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
            }
                
            .onAppear {
                self.isLiked = self.db.likedSongs.contains(self.vm.song)
            }
            .onDisappear() {
                self.isLiked ? self.db.add(self.vm.song) : self.db.remove(self.vm.song)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.isLiked.toggle()
                        self.shouldAnimate = true
                        print(self.isLiked)
                    }) {
                        LottieButton(isPressed: $isLiked, shouldAnimate: $shouldAnimate, from: 0.3, to: 1.0, filename: .heartAnimation)
                            .frame(width: 150, height: 150, alignment: .center)
                    }
                }
            }
        }
            
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(Song(number: 0, title: "Title", lyrics: "Lyrics"), DatabaseManager())
    }
}
