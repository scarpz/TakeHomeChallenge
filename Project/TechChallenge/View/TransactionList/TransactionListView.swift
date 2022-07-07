//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    @State private var transactions: [TransactionModel] = ModelData.sampleTransactions
    
    @State private var dataSource: [TransactionModel] = ModelData.sampleTransactions
    
    @State private var selectedCategory: TransactionModel.Category? {
        didSet {
            self.updateDataSorce()
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            CategoryHeaderView(delegate: self)
            
            List {
                ForEach(self.dataSource) { transaction in
                    TransactionView(transaction: transaction, delegate: self)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
            
            TotalFooterView(category: self.selectedCategory, totalSpent: self.getCurrentTotal())
                .padding(8)
        }
    }
    
    private func updateDataSorce() {
        self.dataSource.filter(from: self.selectedCategory)
    }
    
    private func getCurrentTotal() -> Double {
        return self.transactions.sumExpenses(for: self.selectedCategory)
    }
}

extension TransactionListView: TransactionViewDelegate {
    
    func transactionDidTapped(_ transactionId: Int, isPinned: Bool) {
        
        if let index = self.transactions.firstIndex(where: { $0.id == transactionId }) {
            self.transactions[index].isPinned = isPinned
            self.updateDataSorce()
        }
    }
}

extension TransactionListView: CategoryHeaderViewDelegate {
    
    func didSelectCategory(category: TransactionModel.Category?) {
        self.selectedCategory = category
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
