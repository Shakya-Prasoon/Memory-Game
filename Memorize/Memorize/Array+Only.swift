//
//  Array+Only.swift
//  Memorize
//
//  Created by Prasoon Shakya on 11/27/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
