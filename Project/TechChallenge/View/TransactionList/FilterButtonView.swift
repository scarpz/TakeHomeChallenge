//
//  FilterButtonView.swift
//  TechChallenge
//
//  Created by Felipe Scarpitta on 06/07/2022.
//

import SwiftUI

protocol FilterButtonViewDelegate {
    func buttonDidPress(category: TransactionModel.Category)
}

struct FilterButtonView: View {
    let category: TransactionModel.Category
    let delegate: FilterButtonViewDelegate

    var body: some View {
        Button() {
            delegate.buttonDidPress(category: category)
        } label: {
            Text(category.rawValue)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(10)
                .background(category.color)
                .cornerRadius(25)
        }
    }
}

#if DEBUG
struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(category: .entertainment, delegate: self as! FilterButtonViewDelegate)
    }
}
#endif
