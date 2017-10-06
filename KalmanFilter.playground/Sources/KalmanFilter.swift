//
//  KalmanFilter.swift
//
//  Created by Anas on 9/23/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import Foundation

public struct Kalman {
    
    private var gain = 0.0
    private var estimate = 0.0
    private var estimateError = 10.0
    private var signals: [Double]
    
    public init(signals: [Double]) {
        self.signals = signals
    }
    
    private mutating func calculateKalmanGain() {
        gain = estimateError / (estimateError + 5.0)
    }
    
    private mutating func calculateEstimate(previousEstimate: Double, measurement: Double) {
        estimate = previousEstimate + (gain*(measurement - previousEstimate))
    }
    
    private mutating func calculateEstimateError() {
        estimateError = (1 - gain)*estimateError
    }
    
    public mutating func filter() -> Double {
        
        for index in 0..<signals.count-1 {
            
            calculateKalmanGain()
            
            calculateEstimateError()
            
            calculateEstimate(previousEstimate: index == 0 ? signals[index]: estimate,
                              measurement: signals[index+1])
        }
        return estimate
    }
    
}
