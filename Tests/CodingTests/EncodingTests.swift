import XCTest
import Coding

final class EncodingTests: XCTestCase {
    let encoder = JSONEncoder()

    enum ExampleKeys: CodingKey {
        case value
    }

    func testPullback_WithClosure() {
        XCTAssertEqual(
            "\"TEST STRING\"",
            stringValue(
                try encoder.encode(
                    "Test String",
                    as: .singleValue.pullback { $0.uppercased() }
                )
            )
        )
    }

    func testPullback_WithKeypath() {
        XCTAssertEqual(
            "\"00000000-0000-0000-0000-000012345678\"",
            stringValue(
                try encoder.encode(
                    UUID(uuidString: "00000000-0000-0000-0000-000012345678"),
                    as: Encoding<String>.singleValue.pullback(\.uuidString).optional()
                )
            )
        )
    }

    func testPullback_Pointfree() {
        func multiplyBy(_ a: Int) -> (Int) -> Int {
            { b in a * b }
        }

        XCTAssertEqual(
            "50",
            stringValue(
                try encoder.encode(10, as: .singleValue.pullback(multiplyBy(5)))
            )
        )
    }

    func testOptionalEncoding() {
        struct Value {
            var a: Int
            var b: Int?

            enum CodingKeys: CodingKey {
                case a
                case b
            }
        }

        XCTAssertEqual(
            "{\"a\":123}",
            stringValue(
                try encoder.encode(
                    Value(a: 123, b: nil),
                    as: .combine(
                        Encoding<Int>
                            .withKey(Value.CodingKeys.a)
                            .pullback(\.a),

                        Encoding<Int>
                            .withKey(Value.CodingKeys.b)
                            .optional()
                            .pullback(\.b)
                    )
                )
            )
        )
    }

    func testOptionalEncoding_WithDefaultValue() {
        struct Value {
            var a: Int
            var b: Int?

            enum CodingKeys: CodingKey {
                case a
                case b
            }
        }

        XCTAssertEqual(
            "{\"a\":123,\"b\":0}",
            stringValue(
                try encoder.encode(
                    Value(a: 123, b: nil),
                    as: .combine(
                        Encoding<Int>
                            .withKey(Value.CodingKeys.a)
                            .pullback(\.a),

                        Encoding<Int>
                            .withKey(Value.CodingKeys.b)
                            .defaulting(to: 0)
                            .pullback(\.b)
                    )
                )
            )
        )
    }

    //  MARK: - Built-in encodings

    func testEncoding_UInt16() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(UInt16(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(UInt16(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(UInt16(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Int64() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(Int64(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(Int64(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(Int64(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Int8() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(Int8(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(Int8(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(Int8(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Double() throws {
        XCTAssertEqual(
            "123.5",
            stringValue(try encoder.encode(123.5, as: .singleValue))
        )

        XCTAssertEqual(
            "[123.5]",
            stringValue(try encoder.encode(123.5, as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123.5}",
            stringValue(try encoder.encode(123.5, as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_String() throws {
        XCTAssertEqual(
            "\"Test String\"",
            stringValue(try encoder.encode("Test String", as: .singleValue))
        )

        XCTAssertEqual(
            "[\"Test String\"]",
            stringValue(try encoder.encode("Test String", as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":\"Test String\"}",
            stringValue(try encoder.encode("Test String", as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_UInt64() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(UInt64(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(UInt64(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(UInt64(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_UInt8() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(UInt8(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(UInt8(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(UInt8(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Float() throws {
        XCTAssertEqual(
            "123.5",
            stringValue(try encoder.encode(Float(123.5), as: .singleValue))
        )

        XCTAssertEqual(
            "[123.5]",
            stringValue(try encoder.encode(Float(123.5), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123.5}",
            stringValue(try encoder.encode(Float(123.5), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_UInt32() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(UInt32(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(UInt32(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(UInt32(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_UInt() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(UInt(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(UInt(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(UInt(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Int() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(Int(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(Int(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(Int(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Int32() throws {
        XCTAssertEqual(
            "123",
            stringValue(try encoder.encode(Int32(123), as: .singleValue))
        )

        XCTAssertEqual(
            "[123]",
            stringValue(try encoder.encode(Int32(123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":123}",
            stringValue(try encoder.encode(Int32(123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Bool() throws {
        XCTAssertEqual(
            "true",
            stringValue(try encoder.encode(true, as: .singleValue))
        )

        XCTAssertEqual(
            "[true]",
            stringValue(try encoder.encode(true, as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":true}",
            stringValue(try encoder.encode(true, as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_Encodable() throws {
        struct Value: Encodable {
            var a: Int
        }

        XCTAssertEqual(
            "{\"a\":123}",
            stringValue(try encoder.encode(Value(a: 123), as: .singleValue))
        )

        XCTAssertEqual(
            "[{\"a\":123}]",
            stringValue(try encoder.encode(Value(a: 123), as: .unkeyed))
        )

        XCTAssertEqual(
            "{\"value\":{\"a\":123}}",
            stringValue(try encoder.encode(Value(a: 123), as: .withKey(ExampleKeys.value)))
        )
    }

    func testEncoding_NullValues() {
        XCTAssertEqual(
            "null",
            stringValue(try encoder.encode(123, as: .nullValue))
        )

        XCTAssertEqual(
            "{\"value\":null}",
            stringValue(try encoder.encode(123, as: .nullValue(key: ExampleKeys.value)))
        )
    }

    private func stringValue(_ data: Data) -> String {
        String(data: data, encoding: .utf8)!
    }
}
