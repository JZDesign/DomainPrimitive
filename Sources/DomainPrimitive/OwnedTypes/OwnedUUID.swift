import Foundation

public struct OwnedUUID<Owner>: DomainPrimitive {
    public var rawValue: UUID

    public init(rawValue: UUID) {
        self.rawValue = rawValue
    }
}
