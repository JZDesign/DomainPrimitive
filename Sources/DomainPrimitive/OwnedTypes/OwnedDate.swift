import Foundation

public struct OwnedDate<Owner>: DomainPrimitive {
    public var rawValue: Date

    public init(rawValue: Date) {
        self.rawValue = rawValue
    }
}
