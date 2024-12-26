import XCTest
import DomainPrimitive

final class DomainPrimitiveTests: XCTestCase {
    func testExample() throws {
        try compare(file: "domainPrimitive", withContent: DomainPrimitiveTypes.sample.toString())
        try compare(file: "domainPrimitive", withContent: DomainPrimitiveTypes.sample)
    }
}

enum DomainPrimitiveTypes {
    static let sample = SomeExample(
        uuid: .init(rawValue: .init(uuidString: "811E06EC-73C8-45C2-A4CE-AA99E11B05C7")!),
        stringID: .init(rawValue: "my-string-id"),
        numericalID: .init(rawValue: 32)
    )

    struct SomeUniqueId: DomainPrimitive {
        let rawValue: UUID
    }
    
    struct SomeIdentifier: DomainPrimitive {
        let rawValue: String
    }
    
    struct SomeOtherIdentifier: DomainPrimitive {
        let rawValue: UInt8
    }

    struct SomeExample: Stringable, Equatable {
        let uuid: SomeUniqueId
        let stringID: SomeIdentifier
        let numericalID: SomeOtherIdentifier
    }
}
