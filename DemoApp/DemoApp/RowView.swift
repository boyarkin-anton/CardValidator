//
//  RowView.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 06/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title).bold()
            Divider()
            Text(value).font(.body).lineLimit(nil)
        }
    }
}

#if DEBUG
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "Title", value: "Value")
    }
}
#endif
