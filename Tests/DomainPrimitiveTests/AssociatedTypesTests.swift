import XCTest
import DomainPrimitive

class AssociatedTypesTests: XCTestCase {
    func testExample() throws {
        try compare(file: "associatedTypes", withContent: AssociatedTypes.SomeExample().toString())
        try compare(file: "associatedTypes", withContent: AssociatedTypes.SomeExample())
        // Nothing prevents passing in a random Int here
        AssociatedTypes.printIndex(1)
    }
}

enum AssociatedTypes {
    struct SomeExample: Stringable, Indexed, Named, Countable, Startable, Endable, Activateable, Taggable, Modifiable, Equatable {
        let index: Int
        let name: String
        let count: UInt
        let start: MyDate
        let end: MyDate
        let lastModified: MyDate
        let isActive: Bool
        let tags: [MyTag]

        init() {
            self.index = 1
            self.name = "steve"
            self.count = 4
            self.start = MyDate(rawValue: .distantPast)
            self.end = MyDate(rawValue: .distantFuture)
            self.lastModified = MyDate(rawValue: .distantPast)
            self.isActive = true
            self.tags = [MyTag(rawValue: "new")]
        }
    }

    struct MyDate: DomainPrimitive {
        var rawValue: Date
    }

    struct MyTag: DomainPrimitive {
        var rawValue: String
    }

    static func printIndex(_ index: SomeExample.Index) {
        print(index)
    }
}

protocol Indexed {
    associatedtype Index: DomainPrimitiveType
    var index: Self.Index { get }
}

protocol Named {
    associatedtype Name: ExpressibleByStringLiteral
    var name: Self.Name { get }
}

protocol Countable {
    associatedtype Count: Numeric
    var count: Self.Count { get }
}

protocol Startable {
    associatedtype Start: DomainPrimitiveType
    var start: Self.Start { get }
}

protocol Endable {
    associatedtype End: DomainPrimitiveType
    var end: Self.End { get }
}

protocol Activateable {
    associatedtype IsActive: ExpressibleByBooleanLiteral
    var isActive: Self.IsActive { get }
}

protocol Taggable {
    associatedtype Tag: DomainPrimitive
    var tags: [Self.Tag] { get }
}

protocol Modifiable {
    associatedtype LastModified: DomainPrimitive
    var lastModified: Self.LastModified { get }
}
