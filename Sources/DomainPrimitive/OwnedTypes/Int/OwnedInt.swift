import Foundation

public struct OwnedInt<Owner>: DomainPrimitive {
    public var rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
