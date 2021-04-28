import Foundation
import Combine

// MARK: - Interface

/// Represents a way of encoding a single value.
public struct Decoding<Value> {
    /// A function that uses the provided decoder to decode the given input value
    public var decode: (Decoder) throws -> Value

    public init(decode: @escaping (Decoder) throws -> Value) {
        self.decode = decode
    }
}

// MARK: - Operators

public extension Decoding {
    func map<NewValue>(_ transform: @escaping (Value) -> NewValue) -> Decoding<NewValue> {
        .init { newValue in
            try transform(self.decode(newValue))
        }
    }

    func replaceNil<T>(with defaultValue: T) -> Decoding<T> where Value == T? {
        .init { decoder in
            try self.decode(decoder) ?? defaultValue
        }
    }
}

// MARK: - Decoder API

fileprivate struct DecodingProxy: Decodable {
    let decoder: Decoder

    init(from decoder: Decoder) throws {
        self.decoder = decoder
    }

    func decode<Output>(using decoding: Decoding<Output>) throws -> Output {
        try decoding.decode(decoder)
    }
}

public extension TopLevelDecoder {
    /// Decodes the input into a value `T` using the given decoding.
    ///
    /// - Parameters:
    ///     - input: The input to be decoded.
    ///     - decoding: The decoding to use when decoding the input.
    ///
    func decode<T>(_ input: Input, as decoding: Decoding<T>) throws -> T {
        try decode(DecodingProxy.self, from: input).decode(using: decoding)
    }
}

// MARK: - Build-in decodings

public extension Decoding where Value == UInt16 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int64 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int8 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Double {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == String {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt64 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt8 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Float {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt32 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int32 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Bool {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value: Decodable {
    static var singleValue: Self {
        .init { decoder in
            let container = try decoder.singleValueContainer()
            return try container.decode(Value.self)
        }
    }

    static var unkeyed: Self {
        .init { decoder in
            var container = try decoder.unkeyedContainer()
            return try container.decode(Value.self)
        }
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }

    static var optionalUnkeyed: Decoding<Value?> {
        .init { decoder in
            var container = try decoder.unkeyedContainer()
            return try container.decodeIfPresent(Value.self)
        }
    }

    static func optionalWithKey<Key: CodingKey>(_ key: Key) -> Decoding<Value?> {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decodeIfPresent(Value.self, forKey: key)
        }
    }
}

// MARK: - Zip

public func zip<A, B>(
    _ a: Decoding<A>,
    _ b: Decoding<B>
) -> Decoding<(A, B)> {
    .init { decoder in
        try (a.decode(decoder), b.decode(decoder))
    }
}

public func zip<A, B, Output>(
    with f: @escaping (A, B) -> Output) -> (
    Decoding<A>,
    Decoding<B>
) -> Decoding<Output> {
    { zip($0, $1).map(f) }
}
