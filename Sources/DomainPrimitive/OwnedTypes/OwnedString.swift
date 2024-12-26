import Foundation

public struct OwnedString<Owner>: DomainPrimitive {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
