import Foundation

public typealias DomainPrimitiveType = Codable & Hashable & Equatable

public protocol DomainPrimitive: DomainPrimitiveType, RawRepresentable {
    override associatedtype RawValue: DomainPrimitiveType
    var rawValue: RawValue { get }
}

public extension DomainPrimitive {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

    init(from decoder: any Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(Self.RawValue.self)
        self.init(rawValue: rawValue)!
    }
}
