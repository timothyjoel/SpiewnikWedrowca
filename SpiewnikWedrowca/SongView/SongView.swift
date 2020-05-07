//
//  SongView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct SongView: View {
    
    var vm: SongViewModel
    
    var body: some View {
        VStack {
            List {
                Text(vm.formattedTitle())
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
            HStack {
                Spacer()
                Button(action: {
                    print("Ulubione")
                }) {
                    Text("Dodaj do ulubionych")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Colors.background.name)
                }
                .frame(width: UIScreen.width/2 - 20, height: 50)
                .background(RoundedCorners(color: Colors.main.name, tl: 16, tr: 16, bl: 16, br: 16))
                Spacer()
                Button(action: {
                    print("Dodaj do listy pieśni")
                }) {
                    Text("Dodaj do listy")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Colors.background.name)
                }
                .frame(width: UIScreen.width/2 - 20, height: 50)
                .background(RoundedCorners(color: Colors.main.name, tl: 16, tr: 16, bl: 16, br: 16))
                Spacer()
            }
        }
            
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(vm: SongViewModel(Song(number: 57, title: "Alleluja chwalcie Pana", lyrics: "Lyris lyrisc")))
    }
}

