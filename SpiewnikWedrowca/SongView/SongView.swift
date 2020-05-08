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
    
    var vm: SongViewModel
    @State var isLiked: Bool = false
    @State var shouldAnimate: Bool = false
    
    var body: some View {
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
            Button(action: {
                self.isLiked.toggle()
                self.isLiked ? self.vm.like() : self.vm.unlike()
                self.shouldAnimate = true
            }) {
                LottieButton(isPressed: $isLiked, shouldAnimate: $shouldAnimate, from: 0.3, to: 1.0, filename: .heartAnimation)
                    .frame(width: 150, height: 150, alignment: .center)
            }
            
        }
        .onAppear {
            self.isLiked = self.vm.isLiked
        }
            
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(Song(number: 57, title: "Alleluja chwalcie Pana", lyrics: "Lyris lyrisc"), SongsManager()))
    }
}
