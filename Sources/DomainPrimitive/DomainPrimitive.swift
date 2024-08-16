import Foundation

public protocol DomainPrimitive: Codable, RawRepresentable, Hashable, Equatable {
    override associatedtype RawValue: Codable & Hashable & Equatable
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
