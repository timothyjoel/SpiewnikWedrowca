//
//  SingleSelectionPopup.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 09/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct SingleSelectionPopup: View {

    @Binding var showView: Bool
    var icon: IconImage
    var message: String
    var buttonTitle: String
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 20) {
                Icon(image: icon, size: .large, weight: .semibold, color: .background)
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(RoundedCorners(color: Colors.main.name, tl: 35, tr: 35, bl: 35, br: 35))
                    .shadow(color: Colors.main.name.opacity(0.7), radius: 6, x: 0, y: -4)
                    .offset(x: 0, y: -30)
                    .animation(nil)
                Text(message)
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .padding(.top, -30)
                    .animation(nil)
                VStack {
                    Button(action: {
                        self.action?()
                    }) {
                        Text(buttonTitle)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .animation(nil)
                    }
                    .frame(width: UIScreen.width*2/3 - 32, height: 50, alignment: .center)
                    .foregroundColor(Colors.background.name)
                    .background(RoundedCorners(color: Colors.main.name, tl: 16, tr: 16, bl: 16, br: 16))
                    Button(action: {
                        self.showView.toggle()
                    }) {
                        Text("Anuluj")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .animation(nil)
                    }
                    .foregroundColor(Colors.main.name)
                    .frame(width: UIScreen.width*2/3 - 32, height: 50, alignment: .center)
                }
            }
            .frame(width: UIScreen.width*2/3, alignment: .center)
            .background(RoundedCorners(color: Colors.background.name, tl: 16, tr: 16, bl: 16, br: 16))
            .shadow(radius: 20)
            Spacer()
        }
    }
}

struct SingleSelectionPopup_Previews: PreviewProvider {
    static var previews: some View {
        SingleSelectionPopup(showView: .constant(true), icon: .trash, message: "Czy na pewno chcesz usunąć wszystkie polubione pieśni?", buttonTitle: "Akceptuj", action: nil)
    }
}
