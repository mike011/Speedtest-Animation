//
//  NetworkConnection.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

import Foundation

protocol Connection {
    func getDownloadTransferRate() -> Double
    func getUploadTransferRate() -> Double
    func getPing() -> Double
    func getJitter() -> Double
    func getLoss() -> Double
}

class NetworkConnection: Connection {
    func getDownloadTransferRate() -> Double {
        return Double.random(in: 50..<200)
    }

    func getUploadTransferRate() -> Double {
        return Double.random(in: 0..<75)
    }

    func getPing() -> Double {
        return Double.random(in: 10..<100)
    }

    func getJitter() -> Double {
        return Double.random(in: 2..<20)
    }

    func getLoss() -> Double {
        return Double.random(in: 0..<5)
    }
}
