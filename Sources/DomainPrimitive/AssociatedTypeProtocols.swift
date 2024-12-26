import Foundation

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
