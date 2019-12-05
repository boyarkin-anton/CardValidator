//
//  CardValidity.swift
//  CardValidator
//
//  Created by Anton Boyarkin on 05/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import Foundation

@objc
public enum CardValidity: Int, CaseIterable {
    case invalid = 0
    case valid
    case any
}
