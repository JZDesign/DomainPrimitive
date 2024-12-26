import Foundation

public struct OwnedFloat<Owner>: DomainPrimitive {
    public var rawValue: Float

    public init(rawValue: Float) {
        self.rawValue = rawValue
    }
}
