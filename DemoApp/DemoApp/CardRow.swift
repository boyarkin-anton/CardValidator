//
//  CardRow.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import SwiftUI
import CardValidator

struct CardRow: View {
    var card: CreditCard
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(uiImage: card.network.image).resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 100)
            VStack(alignment: .leading, spacing: 10) {
                Text(card.number)
                Text(card.network.name)
            }
            Spacer()
            Text(card.isValid ? "Valid" : "Invalid").foregroundColor(card.isValid ? .green : .red)
        }
    }
}

#if DEBUG
struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardRow(card: CreditCard("4929804463622139"))
            CardRow(card: CreditCard("4929804463622138"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
