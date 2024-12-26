import Foundation

public typealias DomainPrimitiveType = Codable & Hashable & Equatable

public protocol DomainPrimitive: DomainPrimitiveType, RawRepresentable {
    override associatedtype RawValue: DomainPrimitiveType
    var rawValue: RawValue { get }
}

public extension DomainPrimitive where RawValue == UUID {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

    init(from decoder: any Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(UUID.self)
        self.init(rawValue: rawValue)!
    }
}

public extension DomainPrimitive where RawValue == Decimal {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

    init(from decoder: any Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(Decimal.self)
        self.init(rawValue: rawValue)!
    }
}

public extension DomainPrimitive where RawValue == Date {
    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

    init(from decoder: any Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(Date.self)
        self.init(rawValue: rawValue)!
    }
}
