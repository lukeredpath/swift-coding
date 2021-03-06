import Foundation
import Combine

// MARK: - Interface

/// Represents a way of encoding a single value.
public struct Encoding<Value> {
    /// A function that uses the provided encoder to encode the given input value.
    public var encode: (Value, Encoder) throws -> Void

    public init(encode: @escaping (Value, Encoder) throws -> Void) {
        self.encode = encode
    }
}

// MARK: - Operators

public extension Encoding {
    /// Combines multiple encodings of the same type into a single encoding.
    ///
    static func combine(_ encodings: Self...) -> Self {
        .init { value, encoder in
            for encoding in encodings {
                try encoding.encode(value, encoder)
            }
        }
    }

    /// Transforms an encoding of type `Value` to produce a new encoding of type `NewValue`.
    ///
    /// You can use this function to derive new encodings from existing ones - a common use case would be to
    /// transform an encoding of some lower-level type into some higher-level type by pulling back along a property
    /// on the higher-level type.
    ///
    /// - Parameters:
    ///     - transform: A function that transforms values of `NewValue` into `Value`.
    ///
    func pullback<NewValue>(_ transform: @escaping (NewValue) -> Value) -> Encoding<NewValue> {
        .init { newValue, encoder in
            try self.encode(transform(newValue), encoder)
        }
    }

    /// Turns an encoding of some non-optional value type into an encoding of an optional value of the same type.
    ///
    /// You can use this to encode optional values only if they are non-nil.
    ///
    func optional() -> Encoding<Value?> {
        .init { value, encoder in
            guard let value = value else { return }
            try self.encode(value, encoder)
        }
    }

    /// Turns an encoding of some non-optional value type into an encoding of an optional value of the same type.
    ///
    /// Unlike `.optional()`, this will return an encoding that will encode the value if it is non-nil, otherwise it
    /// will encode the provided default value instead.
    ///
    /// - Parameters:
    ///     - defaultValue: The value to encode when the input value is nil.
    ///
    func replaceNil(with replacementValue: Value) -> Encoding<Value?> {
        .init { value, encoder in
            try self.encode(value ?? replacementValue, encoder)
        }
    }

    /// Turns an encoding of a value into one that encodes that value nested inside a keyed container with the given key.
    func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { value, encoder in
            var container = encoder.container(keyedBy: Key.self)
            try self.encode(value, container.superEncoder(forKey: key))
        }
    }
}

// MARK: - Encoder API

fileprivate struct EncodingProxy<T>: Encodable {
    let value: T
    let encoding: Encoding<T>

    func encode(to encoder: Encoder) throws {
        try encoding.encode(value, encoder)
    }
}

public extension TopLevelEncoder {
    /// Encodes a value `T` using the given encoding.
    ///
    /// - Parameters:
    ///     - value: The value to be encoded.
    ///     - encoding: The encoding used to encode the value.
    ///
    func encode<T>(_ value: T, as encoding: Encoding<T>) throws -> Output {
        try encode(EncodingProxy(value: value, encoding: encoding))
    }
}

// MARK: - Built-in encodings

public extension Encoding where Value: Encodable {
    static var singleValue: Self {
        .init { value, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(value)
        }
    }

    static var unkeyed: Self {
        .init { value, encoder in
            var container = encoder.unkeyedContainer()
            try container.encode(value)
        }
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { value, encoder in
            var container = encoder.container(keyedBy: Key.self)
            try container.encode(value, forKey: key)
        }
    }
}

public extension Encoding where Value: Sequence {
    static func arrayOf(_ encoding: Encoding<Value.Element>) -> Self {
        .init { value, encoder in
            var container = encoder.unkeyedContainer()
            for element in value {
                try encoding.encode(element, container.superEncoder())
            }
        }
    }
}

public extension Encoding {
    static var nullValue: Self {
        .init { _, encoder in
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

    static func nullValue<Key: CodingKey>(key: Key) -> Self {
        .init { _, encoder in
            var container = encoder.container(keyedBy: Key.self)
            try container.encodeNil(forKey: key)
        }
    }
}

// MARK: - Property Wrapper

@propertyWrapper
public struct UsesEncoding<Value>: Encodable {
    public let wrappedValue: Value
    public let encoding: Encoding<Value>

    public init(wrappedValue: Value, _ encoding: Encoding<Value>) {
        self.wrappedValue = wrappedValue
        self.encoding = encoding
    }

    public func encode(to encoder: Encoder) throws {
        try encoding.encode(wrappedValue, encoder)
    }
}
