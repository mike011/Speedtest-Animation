//
//  NetworkConnection.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

protocol Connection {
    func getCurrentTransferRate() -> Double
}

class NetworkConnection: Connection {
    func getCurrentTransferRate() -> Double {
        return Double.random(in: 90..<250)
    }
}
