import Foundation

public struct OwnedInt64<Owner>: DomainPrimitive {
    public var rawValue: Int64

    public init(rawValue: Int64) {
        self.rawValue = rawValue
    }
}
