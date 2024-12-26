import Foundation

/// A type that enforces compiler safety using Phantom or Shadow Types and allows for flat encoding and decoding
public struct OwnedType<Owner, Primitive: DomainPrimitiveType>: DomainPrimitive {
    public var rawValue: Primitive

    public init(rawValue: Primitive) {
        self.rawValue = rawValue
    }
}
