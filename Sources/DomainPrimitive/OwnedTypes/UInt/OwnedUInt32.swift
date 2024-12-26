import Foundation

public struct OwnedUInt32<Owner>: DomainPrimitive {
    public var rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}
