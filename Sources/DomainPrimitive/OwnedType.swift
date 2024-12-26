import Foundation

public struct OwnedType<Owner, Primitive: DomainPrimitiveType>: DomainPrimitive {
    public var rawValue: Primitive

    public init(rawValue: Primitive) {
        self.rawValue = rawValue
    }
}
