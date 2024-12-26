import Foundation

public struct OwnedUInt16<Owner>: DomainPrimitive {
    public var rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}
