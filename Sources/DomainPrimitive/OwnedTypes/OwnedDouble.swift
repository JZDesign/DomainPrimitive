import Foundation

public struct OwnedDouble<Owner>: DomainPrimitive {
    public var rawValue: Double

    public init(rawValue: Double) {
        self.rawValue = rawValue
    }
}
