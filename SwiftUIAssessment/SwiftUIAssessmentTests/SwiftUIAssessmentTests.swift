//
//  SwiftUIAssessmentTests.swift
//  SwiftUIAssessmentTests
//
//  Created by Nikhlesh on 29/12/21.
//

import XCTest
@testable import SwiftUI_Assessment

class SwiftUIAssessmentTests: XCTestCase {
    
    // NOTE: I create UI and Unit test cases for as API response, but we can also create UI and Unit test cases from create stub and Mock data.
    
    var apiService:APIService? = nil

    override func setUp() {
        super.setUp()
        
        apiService = APIService()
    }
    
    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetProfileAPIWorking() {
        let expectation = XCTestExpectation.init(description: "Profile")
        
        apiService?.getAccount { accountObject, error in
             if let account = accountObject {
                 XCTAssertEqual(account.firstName, "Luke")
                 XCTAssertEqual(account.lastName, "Skywalker")
                 XCTAssertEqual(account.email, "luke.skywalk@crossover.com")
                 XCTAssertEqual(account.details.studentID, "0342")
                 XCTAssertEqual(account.details.campusID, "001")
                 XCTAssertEqual(account.details.gtLevel, "L3")
                 XCTAssertEqual(account.details.mapGradeLevel, 6)
                 XCTAssertEqual(account.details.house, "House of Waterloo")
                 expectation.fulfill()
            } else if error != nil {
                XCTFail("Fail")
            }
        }

        wait(for: [expectation], timeout: 60)
    }
    
    func testGetRewardInfoAPIWorking() {
        let expectation = XCTestExpectation.init(description: "Reward Info")
        
        apiService?.getRewardsInfo { rewardObject, error in
            if var rewards = rewardObject {
                
                XCTAssertEqual(rewards.cardNumber, "9901")
                XCTAssertEqual(rewards.cardExpirationDate, "2023-12")
                XCTAssertEqual(rewards.balance, 139.47)
                XCTAssertGreaterThan(rewards.transactions.count, 0)
                
                // Chronological order
                rewards.transactions = rewards.transactions.sorted {$0.rewardDate < $1.rewardDate}
                
                if let firstObject = rewards.transactions.first, rewards.transactions.count > 1 {
                    let secondObject = rewards.transactions[1]
                    XCTAssertLessThan(firstObject.date, secondObject.date)
                }
                expectation.fulfill()
                
            } else if error != nil {
                XCTFail("Fail")
            }
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    func testGetTransactionListAPIWorking() {
        
        let expectation = XCTestExpectation.init(description: "Reward List")
        
        apiService?.getRewardsTransections(completion: { rewardList, error in
            if let rewards = rewardList {
                XCTAssertGreaterThan(rewards.count, 0)
                
                let reward = rewards[0]
                XCTAssertEqual(reward.id, "N10D54V321")
                XCTAssertEqual(reward.title, "Starbucks")
                XCTAssertEqual(reward.date, "2021-07-26")
                XCTAssertEqual(reward.amount, -10.54)
                XCTAssertEqual(reward.bird, false)
                
                expectation.fulfill()
           } else if error != nil {
               XCTFail("Fail")
           }
        })
        
        wait(for: [expectation], timeout: 60)
        
    }
    
    func testGetTransactionDetailAPIWorking() {
        
        let expectation = XCTestExpectation.init(description: "Reward Detail")
        
        apiService?.getRewardTransectionDetail(id: "N10D54V321", completion: { rewardDetail, error in
            if let reward = rewardDetail {
                XCTAssertEqual(reward.id, "N10D54V321")
                XCTAssertEqual(reward.title, "Starbucks")
                XCTAssertEqual(reward.date, "2021-07-26")
                XCTAssertEqual(reward.amount, -10.54)
                XCTAssertEqual(reward.bird, false)
                XCTAssertEqual(reward.status, "Completed")
                
                expectation.fulfill()
           } else if error != nil {
               XCTFail("Fail")
           }
        })
        
        wait(for: [expectation], timeout: 60)
        
    }

}
