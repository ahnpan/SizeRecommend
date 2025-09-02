//
//  SizeRecommendCoreTests.swift
//  SizeRecommendCoreTests
//
//  Created by Ruby Vega on 9/2/25.
//

import XCTest
@testable import SizeRecommendCore

class SizeRecommendCoreTests: XCTestCase {
    let recommender = SizeRecommend()

    /* Testing Get BMI Function*/
    func testBMICalculation() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 55.0
        let bmi = CheckNoThrow(try recommender.getBMI(height: height, weight: weight))
        
        // Assert
        XCTAssertEqual(bmi, 21.218317194552675)
    }
    
    func testBMIPositiveNoThrow() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 55.0
        
        // Assert
        XCTAssertNoThrow(try recommender.getBMI(height: height, weight: weight))
    }
    
    func testBMINegativeHeightThrows() async {
        // Arrange
        let height: Double = -161.0
        let weight: Double = 55.0
        
        // Assert
        XCTAssertThrowsError(try recommender.getBMI(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidHeight)
        }
    }
    
    func testBMINegativeWeightThrows() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = -55.0
        
        // Assert
        XCTAssertThrowsError(try recommender.getBMI(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidWeight)
        }
    }
    
    func testBMIZeroHeightThrows() async {
        // Arrange
        let height: Double = 0
        let weight: Double = 55.0
        
        // Assert
        XCTAssertThrowsError(try recommender.getBMI(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidHeight)
        }
    }
    
    func testBMIZeroWeightThrows() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 0
        
        // Assert
        XCTAssertThrowsError(try recommender.getBMI(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidWeight)
        }
    }
    
    /* Testing Get Size Function*/
    func testSizePositiveWeightAndHeight() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 55.0

        // Assert
        XCTAssertNoThrow(try recommender.getSize(height: height, weight: weight))
    }
    
    func testSizePositiveWeightAndNegativeHeightThrow() async {
        // Arrange
        let height: Double = -161.0
        let weight: Double = 55.0

        // Assert
        XCTAssertThrowsError(try recommender.getSize(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidHeight)
        }
    }
    
    func testSizeNegativeWeightAndPositiveHeightThrow() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = -55.0

        // Assert
        // Assert
        XCTAssertThrowsError(try recommender.getSize(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidWeight)
        }
    }
    
    func testSizePositiveWeightAndZeroHeightThrow() async {
        // Arrange
        let height: Double = 0
        let weight: Double = 55.0

        // Assert
        XCTAssertThrowsError(try recommender.getSize(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidHeight)
        }
    }
    
    func testSizeZeroWeightAndPositiveHeightThrow() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 0

        // Assert
        XCTAssertThrowsError(try recommender.getSize(height: height, weight: weight)) { error in
            XCTAssertEqual(error as! SizeRecommendError, SizeRecommendError.invalidWeight)
        }
    }
    
    func testPositiveWeightAndHeightS() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 45.0
        let size = CheckNoThrow(try recommender.getSize(height: height, weight: weight))
        
        // Assert
        XCTAssertEqual(size, .small)
    }
    
    func testPositiveWeightAndHeightM() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 55.0
        let size = CheckNoThrow(try recommender.getSize(height: height, weight: weight))
        
        // Assert
        XCTAssertEqual(size, .medium)
    }
    
    func testPositiveWeightAndHeightL() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 65.0
        let size = CheckNoThrow(try recommender.getSize(height: height, weight: weight))
        
        // Assert
        XCTAssertEqual(size, .large)
    }
    
    func testPositiveWeightAndHeightXL() async {
        // Arrange
        let height: Double = 161.0
        let weight: Double = 80.0
        let size = CheckNoThrow(try recommender.getSize(height: height, weight: weight))
        
        // Assert
        XCTAssertEqual(size, .extraLarge)
    }
    
    func CheckNoThrow<T>(
      _ expression: @autoclosure () throws -> T,
      _ message: @autoclosure () -> String = "",
      file: StaticString = (#filePath),
      line: UInt = #line
    ) -> T? {
      var r: T?
      XCTAssertNoThrow(
        try { r = try expression() }(), message(), file: file, line: line)
      return r
    }
}
