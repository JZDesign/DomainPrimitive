import Foundation

public struct OwnedDecimal<Owner>: DomainPrimitive {
    public var rawValue: Decimal

    public init(rawValue: Decimal) {
        self.rawValue = rawValue
    }
}
