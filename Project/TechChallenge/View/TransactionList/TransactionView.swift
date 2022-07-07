//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

protocol TransactionViewDelegate {
    func transactionDidTapped(_ transactionId: Int, isPinned: Bool)
}

struct TransactionView: View {
    
    let transaction: TransactionModel
    let delegate: TransactionViewDelegate
    
    @State private var isPinned: Bool = true
    @State private var imageName: String = "pin.fill"
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Image(systemName: self.imageName)
            }
            
            if self.isPinned {
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .gesture(
            TapGesture().onEnded({ _ in
                delegate.transactionDidTapped(self.transaction.id, isPinned: !self.isPinned)
                self.isPinned = !self.isPinned
                self.imageName = self.isPinned ? "pin.fill" : "pin.slash.fill"
            })
        )
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0],
                            delegate: self as! TransactionViewDelegate)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
