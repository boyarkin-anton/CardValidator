//
//  BankView.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 06/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import SwiftUI
import CardValidator

struct BankView: View {
    var bank: Bank
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Bank").bold()
            Divider()
            if self.bank.name != nil {
                RowView(title: "Name", value: self.bank.name!)
            }
            if self.bank.city != nil {
                RowView(title: "City", value: self.bank.city!)
            }
            if self.bank.phone != nil {
                RowView(title: "Phone", value: self.bank.phone!)
            }
            if self.bank.url != nil {
                RowView(title: "Url", value: self.bank.url!)
            }
            Divider()
        }
    }
}

#if DEBUG
struct BankView_Previews: PreviewProvider {
    static var previews: some View {
        BankView(bank: Bank())
    }
}
#endif
