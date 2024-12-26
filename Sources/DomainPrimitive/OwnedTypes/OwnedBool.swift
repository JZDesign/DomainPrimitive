import Foundation

public struct OwnedBool<Owner>: DomainPrimitive {
    public var rawValue: Bool

    public init(rawValue: Bool) {
        self.rawValue = rawValue
    }
}
