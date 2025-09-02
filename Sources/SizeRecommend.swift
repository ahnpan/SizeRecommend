//
//  SizeRecommend.swift
//  SizeRecommend
//
//  Created by Ruby Vega on 9/2/25.
//

import Foundation

public class SizeRecommend {
        
    public func getBMI(
        height: Double,
        weight: Double
    ) throws -> Double {
        guard height > 0 else {
            throw SizeRecommendError.invalidHeight
        }
        
        guard weight > 0 else {
            throw SizeRecommendError.invalidWeight
        }
        
        return weight / pow(height/100, 2)
    }
    
    public func getSize(
        height: Double,
        weight: Double
    ) throws -> Size  {
        guard height > 0 else {
            throw SizeRecommendError.invalidHeight
        }
        
        guard weight > 0 else {
            throw SizeRecommendError.invalidWeight
        }
        
        guard let bmi = try? getBMI(height: height, weight: weight) else {
            throw SizeRecommendError.invalidBMI
        }
        
        if bmi < 18.5 {
            return .small
        } else if bmi < 24.9 {
            return .medium
        } else if bmi < 29.9 {
            return .large
        } else {
            return .extraLarge
        }
    }
}
