//
//  CategoryHeaderView.swift
//  TechChallenge
//
//  Created by Felipe Scarpitta on 06/07/2022.
//

import SwiftUI

protocol CategoryHeaderViewDelegate {
    func didSelectCategory(category: TransactionModel.Category?)
}

struct CategoryHeaderView: View {
    
    let delegate: CategoryHeaderViewDelegate
    
    let spacing: CGFloat = 10
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: self.spacing) {
                Button {
                    delegate.didSelectCategory(category: nil)
                } label: {
                    Text("all")
                        .font(.title2)
                        .bold()
                        .frame(width: 40)
                        .foregroundColor(.white)
                        .padding(self.spacing)
                        .background(Color.black)
                        .cornerRadius(25)
                }
                
                ForEach(TransactionModel.Category.allCases, id: \.self) { category in
                    FilterButtonView(category: category, delegate: self)
                }
            }.padding(EdgeInsets(top: 0, leading: self.spacing, bottom: 0, trailing: self.spacing))
        }
        .background(Color.accentColor.opacity(0.8))
        .frame(height: 75)
    }
}

extension CategoryHeaderView: FilterButtonViewDelegate {
    
    func buttonDidPress(category: TransactionModel.Category) {
        delegate.didSelectCategory(category: category)
    }
}

#if DEBUG
struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeaderView(delegate: self as! CategoryHeaderViewDelegate)
    }
}
#endif
