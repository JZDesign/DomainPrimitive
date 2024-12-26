import Foundation

public struct OwnedInt8<Owner>: DomainPrimitive {
    public var rawValue: Int8

    public init(rawValue: Int8) {
        self.rawValue = rawValue
    }
}
