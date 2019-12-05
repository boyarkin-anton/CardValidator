//
//  CardsListView.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 04/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import Combine
import SwiftUI
import CardValidator

struct Item<T>: Identifiable {
    let id: UUID = UUID()
    let content: T
}

final class FilterData: ObservableObject {
    @Published var validity = CardValidity.any
    @Published var type = CardType.unknown
}

struct CardsListView: View {
    @EnvironmentObject private var filterData: FilterData
    
    var data = [Item<CreditCard>]()
    private var content: [CreditCard] {
        return data.map { $0.content}
    }
    
    private let validator = CardValidator()
    
    init(cards: [CreditCard] = []) {
        self.data = cards.map { Item(content: $0) }
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("", selection: self.$filterData.validity) {
                    ForEach(CardValidity.allCases, id: \.self) { item in
                        Text(item.name).tag(item)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Picker("", selection: self.$filterData.type) {
                    ForEach(CardType.filter, id: \.name) { item in
                        Text(item.name).tag(item)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                ForEach(self.validator.filter(list: self.content, validity: self.filterData.validity, network: self.filterData.type).map { Item(content: $0) }) { item in
                    NavigationLink(destination: CardDetails(card: item.content).environmentObject(CardData())) {
                        CardRow(card: item.content)
                    }
                }
            }.navigationBarTitle(Text("Credit Cards"), displayMode: .large)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
#endif
