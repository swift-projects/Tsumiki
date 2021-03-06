//
//  OptionalExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Optional {
    public func `do`(_ body: (Wrapped) -> Void) {
        if case .some(let wrapped) = self {
            body(wrapped)
        }
    }
    
    public func getOrElse(_ `else`: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    public func maybe<T>(_ `default`: @autoclosure () -> T, onSome: (Wrapped) -> T) -> T {
        return self.map(onSome) ?? `default`()
    }
}
