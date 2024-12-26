import Foundation

public struct OwnedInt16<Owner>: DomainPrimitive {
    public var rawValue: Int16

    public init(rawValue: Int16) {
        self.rawValue = rawValue
    }
}
