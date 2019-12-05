//
//  CardDetailsView.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import SwiftUI
import CardValidator

final class CardData: ObservableObject {
    @Published var loaded = false
    @Published var data: CardInfo?
}

struct CardDetailsView: View {
    @EnvironmentObject private var cardData: CardData
    
    var card: CreditCard
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 10) {
                CardRow(card: card).padding()
                Divider()
                if self.cardData.loaded {
                    if self.cardData.data == nil {
                        Text("No additional Info found").padding()
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            if self.cardData.data!.brand != nil {
                                RowView(title: "Brand", value:self.cardData.data!.brand!)
                                Divider()
                            }
                            if self.cardData.data!.type != nil {
                                RowView(title: "Type", value:self.cardData.data!.type!)
                                Divider()
                            }
                            if self.cardData.data!.country?.name != nil {
                                HStack {
                                    Text("Country").bold()
                                    Divider()
                                    if self.cardData.data!.country?.emoji != nil {
                                        Text(self.cardData.data!.country!.emoji!)
                                    }
                                    Text(self.cardData.data!.country!.name!)
                                }
                                Divider()
                            }
                            if self.cardData.data!.bank?.name != nil {
                                BankView(bank: self.cardData.data!.bank!)
                            }
                        }.padding()
                    }
                }
            }
        }
        .navigationBarTitle(Text(verbatim: card.number), displayMode: .inline)
        .onAppear {
            CardValidator().getCardInfo(for: self.card.number) { result in
                switch result {
                case .success(let info) :
                    DispatchQueue.main.async {
                        self.cardData.data = info
                    }
                case .failure: break
                }
                
                DispatchQueue.main.async {
                    self.cardData.loaded = true
                }
            }
        }
    }
}

#if DEBUG
struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(card: CreditCard("4929804463622139")).environmentObject(CardData())
    }
}
#endif

