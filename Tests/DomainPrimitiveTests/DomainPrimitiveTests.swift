import XCTest
import DomainPrimitive

final class DomainPrimitiveTests: XCTestCase {
    func testExample() throws {
        try compare(file: "domainPrimitive", withContent: DomainPrimitiveTypes.sample.toString())
        try compare(file: "domainPrimitive", withContent: DomainPrimitiveTypes.sample)
    }

    func testComplex() throws {
        try compare(file: "complex", withContent: DomainPrimitiveTypes.complex.toString())
        try compare(file: "complex", withContent: DomainPrimitiveTypes.complex)

        try compare(file: "complex2", withContent: DomainPrimitiveTypes.complex2.toString())
        try compare(file: "complex2", withContent: DomainPrimitiveTypes.complex2)
    }
}

enum DomainPrimitiveTypes {
    static let sample = SomeExample(
        uuid: .init(rawValue: .init(uuidString: "811E06EC-73C8-45C2-A4CE-AA99E11B05C7")!),
        stringID: .init(rawValue: "my-string-id"),
        numericalID: .init(rawValue: 32)
    )

    static let complex = ComplexExample(rawValue: sample)
    static let complex2 = ComplexExample2(data: complex)

    struct SomeUniqueId: DomainPrimitive {
        let rawValue: UUID
    }
    
    struct SomeIdentifier: DomainPrimitive {
        let rawValue: String
    }
    
    struct SomeOtherIdentifier: DomainPrimitive {
        let rawValue: UInt8
    }

    struct SomeExample: Stringable, Hashable, Equatable {
        let uuid: SomeUniqueId
        let stringID: SomeIdentifier
        let numericalID: SomeOtherIdentifier
    }

    // MARK: - These are really unecessary examples.
    // There is no reason to use the domain primitive this way, but for the sake of being thorough… Here they are

    struct ComplexExample: Stringable, DomainPrimitive {
        let rawValue: SomeExample
    }

    struct ComplexExample2: Stringable, Equatable {
        let data: ComplexExample
    }
}
