import Foundation

public struct OwnedInt32<Owner>: DomainPrimitive {
    public var rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
}
