import Foundation

public struct OwnedUInt<Owner>: DomainPrimitive {
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}
