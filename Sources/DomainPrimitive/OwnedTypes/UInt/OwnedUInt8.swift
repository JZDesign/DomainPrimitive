import Foundation

public struct OwnedUInt8<Owner>: DomainPrimitive {
    public var rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}
