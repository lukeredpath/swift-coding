import XCTest
import Coding

final class DecodingTests: XCTestCase {
    let decoder = JSONDecoder()

    enum ExampleKeys: CodingKey {
        case value
    }

    // MARK: - Built-in decodings

    func testDecoding_UInt16() throws {
        XCTAssertEqual(
            UInt16(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            UInt16(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            UInt16(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt16>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<UInt16>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Int64() throws {
        XCTAssertEqual(
            Int64(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Int64(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Int64(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int64>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Int64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int64>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Int64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int64>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<Int64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int64>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Int64>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int64>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Int64>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int64>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<Int64>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Int8() throws {
        XCTAssertEqual(
            Int8(-123),
            try decoder.decode(
                "-123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Int8(-123),
            try decoder.decode(
                "[-123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Int8(-123),
            try decoder.decode(
                "{\"value\":-123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int8>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Int8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int8>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Int8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int8>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<Int8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int8>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Int8>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int8>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Int8>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int8>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<Int8>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Double() throws {
        XCTAssertEqual(
            Double(123.5),
            try decoder.decode(
                "123.5".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Double(123.5),
            try decoder.decode(
                "[123.5]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Double(123.5),
            try decoder.decode(
                "{\"value\":123.5}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Double>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Double>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Double>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Double>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Double>.some(123.5),
            try decoder.decode(
                "[123.5]".data(using: .utf8)!,
                as: Decoding<Double>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Double>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Double>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Double>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Double>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Double>.some(123.5),
            try decoder.decode(
                "{\"value\":123.5}".data(using: .utf8)!,
                as: Decoding<Double>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_String() throws {
        XCTAssertEqual(
            "Test String",
            try decoder.decode(
                "\"Test String\"".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            "Test String",
            try decoder.decode(
                "[\"Test String\"]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            "Test String",
            try decoder.decode(
                "{\"value\":\"Test String\"}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<String>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<String>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<String>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<String>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<String>.some("Test String"),
            try decoder.decode(
                "[\"Test String\"]".data(using: .utf8)!,
                as: Decoding<String>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<String>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<String>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<String>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<String>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<String>.some("Test String"),
            try decoder.decode(
                "{\"value\":\"Test String\"}".data(using: .utf8)!,
                as: Decoding<String>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_UInt64() throws {
        XCTAssertEqual(
            UInt64(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            UInt64(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            UInt64(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt64>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<UInt64>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_UInt8() throws {
        XCTAssertEqual(
            UInt8(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            UInt8(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            UInt8(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt8>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<UInt8>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Float() throws {
        XCTAssertEqual(
            Float(123.5),
            try decoder.decode(
                "123.5".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Float(123.5),
            try decoder.decode(
                "[123.5]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Float(123.5),
            try decoder.decode(
                "{\"value\":123.5}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Float>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Float>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Float>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Float>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Float>.some(123.5),
            try decoder.decode(
                "[123.5]".data(using: .utf8)!,
                as: Decoding<Float>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Float>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Float>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Float>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Float>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Float>.some(123.5),
            try decoder.decode(
                "{\"value\":123.5}".data(using: .utf8)!,
                as: Decoding<Float>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_UInt32() throws {
        XCTAssertEqual(
            UInt32(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            UInt32(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            UInt32(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt32>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<UInt32>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_UInt() throws {
        XCTAssertEqual(
            UInt(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            UInt(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            UInt(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UInt>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UInt>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<UInt>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UInt>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UInt>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UInt>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UInt>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<UInt>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Int() throws {
        XCTAssertEqual(
            Int(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Int(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Int(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Int>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Int>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<Int>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Int>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Int>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<Int>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Int32() throws {
        XCTAssertEqual(
            Int32(123),
            try decoder.decode(
                "123".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            Int32(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            Int32(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int32>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Int32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int32>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Int32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int32>.some(123),
            try decoder.decode(
                "[123]".data(using: .utf8)!,
                as: Decoding<Int32>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Int32>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Int32>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int32>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Int32>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Int32>.some(123),
            try decoder.decode(
                "{\"value\":123}".data(using: .utf8)!,
                as: Decoding<Int32>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Bool() throws {
        XCTAssertEqual(
            true,
            try decoder.decode(
                "true".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            false,
            try decoder.decode(
                "[false]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            true,
            try decoder.decode(
                "{\"value\":true}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Bool>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<Bool>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Bool>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<Bool>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Bool>.some(true),
            try decoder.decode(
                "[true]".data(using: .utf8)!,
                as: Decoding<Bool>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<Bool>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<Bool>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Bool>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<Bool>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<Bool>.some(true),
            try decoder.decode(
                "{\"value\":true}".data(using: .utf8)!,
                as: Decoding<Bool>.optionalWithKey(ExampleKeys.value)
            )
        )
    }

    func testDecoding_Encodable() throws {
        let uuid = UUID()

        XCTAssertEqual(
            uuid,
            try decoder.decode(
                "\"\(uuid.uuidString)\"".data(using: .utf8)!,
                as: .singleValue
            )
        )
        XCTAssertEqual(
            uuid,
            try decoder.decode(
                "[\"\(uuid.uuidString)\"]".data(using: .utf8)!,
                as: .unkeyed
            )
        )
        XCTAssertEqual(
            uuid,
            try decoder.decode(
                "{\"value\":\"\(uuid.uuidString)\"}".data(using: .utf8)!,
                as: .withKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UUID>.none,
            try decoder.decode(
                "[]".data(using: .utf8)!,
                as: Decoding<UUID>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UUID>.none,
            try decoder.decode(
                "[null]".data(using: .utf8)!,
                as: Decoding<UUID>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UUID>.some(uuid),
            try decoder.decode(
                "[\"\(uuid.uuidString)\"]".data(using: .utf8)!,
                as: Decoding<UUID>.optionalUnkeyed
            )
        )
        XCTAssertEqual(
            Optional<UUID>.none,
            try decoder.decode(
                "{}".data(using: .utf8)!,
                as: Decoding<UUID>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UUID>.none,
            try decoder.decode(
                "{\"value\":null}".data(using: .utf8)!,
                as: Decoding<UUID>.optionalWithKey(ExampleKeys.value)
            )
        )
        XCTAssertEqual(
            Optional<UUID>.some(uuid),
            try decoder.decode(
                "{\"value\":\"\(uuid.uuidString)\"}".data(using: .utf8)!,
                as: Decoding<UUID>.optionalWithKey(ExampleKeys.value)
            )
        )
    }
}