//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    
    var transactions: [TransactionModel]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.transactions = ModelData.sampleTransactions
    }

    override func tearDownWithError() throws {
        self.transactions = nil
    }

    func testFilter() {
        
        let category: TransactionModel.Category = .health
        
        self.transactions.filter(from: category)
        
        for transaction in self.transactions {
            XCTAssertEqual(transaction.category, category)
        }
    }
    
    func testSumFromCategory() {
        
        let category: TransactionModel.Category = .food
        let testSum: Double = 74.28
        
        let expectedSum = self.transactions.sumExpenses(for: category)
        
        XCTAssert(expectedSum == testSum)
        
    }

}
