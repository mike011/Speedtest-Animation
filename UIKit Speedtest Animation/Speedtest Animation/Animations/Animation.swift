//
//  Animation.swift
//  Speedtest Animation
//
//  Created by Michael Charland on 2020-10-22.
//

@MainActor
public protocol Animation: AnyObject {
    func start()
    func finish()
}
