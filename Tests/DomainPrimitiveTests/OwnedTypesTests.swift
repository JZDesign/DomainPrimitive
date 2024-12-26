import XCTest
@testable import DomainPrimitive

final class OwnedTypesTests: XCTestCase {
    func testExample() throws {
        try compare(file: "ownedTypes", withContent: OwnedTypes.SomeExample().toString())
        try compare(file: "ownedTypes", withContent: OwnedTypes.SomeExample())
        
        // Phantom types prevents passing in a random value here
        OwnedTypes.printName(OwnedString<OwnedTypes>(rawValue: "name"))
    }
}

enum OwnedTypes {
    struct SomeExample: Stringable, Equatable {
        let i: OwnedInt<Self>
        let i8: OwnedInt8<Self>
        let i16: OwnedInt16<Self>
        let i32: OwnedInt32<Self>
        let i64: OwnedInt64<Self>

        let u: OwnedInt<Self>
        let u8: OwnedInt8<Self>
        let u16: OwnedInt16<Self>
        let u32: OwnedInt32<Self>
        let u64: OwnedInt64<Self>

        let float: OwnedFloat<Self>
        let decimal: OwnedDecimal<Self>
        let double: OwnedDouble<Self>

        let bool: OwnedBool<Self>
        let date: OwnedDate<Self>
        let string: OwnedString<Self>
        let uuid: OwnedUUID<Self>

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

    static func printName(_ name: OwnedString<Self>) {
        print(name)
    }
}
