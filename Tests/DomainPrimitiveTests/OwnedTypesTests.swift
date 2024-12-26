import XCTest
@testable import DomainPrimitive

final class OwnedTypesTests: XCTestCase {
    func testExample() throws {
        try compare(file: "ownedTypes", withContent: OwnedTypes.SomeExample().toString())
        try compare(file: "ownedTypes", withContent: OwnedTypes.SomeExample())

        // Phantom types prevents passing in a random value here
        OwnedTypes.printID(OwnedTypes.SomeExample().uuid)
    }
}

enum OwnedTypes {
    struct SomeExample: Stringable, Equatable {
        typealias ID = OwnedType<Self, UUID>

        let i: OwnedType<Self, Int>
        let i8: OwnedType<Self, Int8>
        let i16: OwnedType<Self, Int16>
        let i32: OwnedType<Self, Int32>
        let i64: OwnedType<Self, Int64>

        let u: OwnedType<Self, Int>
        let u8: OwnedType<Self, Int8>
        let u16: OwnedType<Self, Int16>
        let u32: OwnedType<Self, Int32>
        let u64: OwnedType<Self, Int64>

        let float: OwnedType<Self, Float>
        let decimal: OwnedType<Self, Decimal>
        let double: OwnedType<Self, Double>

        let bool: OwnedType<Self, Bool>
        let date: OwnedType<Self, Date>
        let string: OwnedType<Self, String>
        let uuid: ID

        init() {
            self.i = .init(rawValue: 100)
            self.i8 = .init(rawValue: 100)
            self.i16 = .init(rawValue: 100)
            self.i32 = .init(rawValue: 100)
            self.i64 = .init(rawValue: 100)
            self.u = .init(rawValue: 100)
            self.u8 = .init(rawValue: 100)
            self.u16 = .init(rawValue: 100)
            self.u32 = .init(rawValue: 100)
            self.u64 = .init(rawValue: 100)
            self.float = .init(rawValue: 1.1)
            self.decimal = .init(rawValue: 1.4563)
            self.double = .init(rawValue: 1.1)
            self.bool = .init(rawValue: false)
            self.date = .init(rawValue: Date.distantPast)
            self.string = .init(rawValue: "string")
            self.uuid = .init(rawValue: .init(uuidString: "811E06EC-73C8-45C2-A4CE-AA99E11B05C7")!)
        }
    }

    static func printID(_ id: OwnedTypes.SomeExample.ID) {
        print(id.rawValue.uuidString)
    }
}
