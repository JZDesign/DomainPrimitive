import Foundation

public struct OwnedUInt64<Owner>: DomainPrimitive {
    public var rawValue: UInt64

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
}
