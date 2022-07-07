//
//  TotalFooterView.swift
//  TechChallenge
//
//  Created by Felipe Scarpitta on 06/07/2022.
//

import SwiftUI

struct TotalFooterView: View {
    
    let category: TransactionModel.Category?
    
    var totalSpent: Double
    
    var totalSpentValue: String {
        return "$\(self.totalSpent.formatted())"
    }
    
    var body: some View {
        VStack(spacing: 5) {
                Text(category?.rawValue ?? "all")
                    .font(.headline)
                    .foregroundColor(self.category?.color ?? .black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack(spacing: 2) {
                    Text("Total spent:")
                        .secondary()
                        .frame(alignment: .leading)
                    Spacer()
                    Text(self.totalSpentValue)
                        .bold()
                        .secondary()
                        .frame(alignment: .trailing)
                }
            }
            .padding(12)
            .border(Color.accentColor, width: 2)
            .cornerRadius(8)
    }
}

#if DEBUG
struct TotalFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TotalFooterView(category: .health, totalSpent: 0)
    }
}
#endif
