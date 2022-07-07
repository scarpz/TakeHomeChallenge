//
//  Array.swift
//  TechChallenge
//
//  Created by Felipe Scarpitta on 06/07/2022.
//

import Foundation
import SwiftUI

extension Array where Element == TransactionModel {
    
    mutating func filter(from category: TransactionModel.Category?) {
        
        if let category = category {
            self = ModelData.sampleTransactions.filter({ $0.category == category })
        } else {
            self = ModelData.sampleTransactions
        }
    }
    
    func sumExpenses(for category: TransactionModel.Category?) -> Double {
        return self.reduce(0) { partialResult, nextTransaction in
            
            if let category = category {
                
                if category == nextTransaction.category && nextTransaction.isPinned {
                    return partialResult + nextTransaction.amount
                } else {
                    return partialResult
                }
            } else {
                if nextTransaction.isPinned {
                    return partialResult + nextTransaction.amount
                } else {
                    return partialResult
                }
            }
        }
    }
}
