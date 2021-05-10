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
                    as: .combineWithKeys(
                        Value.CodingKeys.self,

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
                    as: .combineWithKeys(
                        Value.CodingKeys.self,

                        Encoding<Int>
                            .withKey(Value.CodingKeys.a)
                            .pullback(\.a),

                        Encoding<Int>
                            .withKey(Value.CodingKeys.b)
                            .replaceNil(with: 0)
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

    //  MARK: - Collection Encoding

    func testEncodeArrayWithCustomEncodingForEachValue() {
        let strings = ["One", "Two", "Three"]

        XCTAssertEqual(
            "[\"One\",\"Two\",\"Three\"]",
            stringValue(try encoder.encode(strings, as: .singleValue))
        )

        let uppercased: Encoding<String> = .singleValue.pullback { $0.uppercased() }

        XCTAssertEqual(
            "[\"ONE\",\"TWO\",\"THREE\"]",
            stringValue(try encoder.encode(strings, as: .arrayOf(uppercased)))
        )
    }

    // MARK: - Complex Encoding

    func testNestedEncoding() {
        encoder.outputFormatting = .prettyPrinted

        let car = Car(
            name: "McLaren F1",
            model: .init(name: "F1"),
            manufacturer: .init(name: "McLaren"),
            availableColors: ["red", "silver"]
        )

        XCTAssertEqual(
            """
            {
              "manufacturer" : {
                "name" : "McLaren"
              },
              "model" : {
                "name" : "F1",
                "engineSizes" : [
                  5000,
                  6000,
                  7000
                ]
              },
              "availableColors" : [
                "RED",
                "SILVER"
              ],
              "name" : "McLaren F1"
            }
            """,
            stringValue(try encoder.encode(car, as: .default))
        )
    }

    func testCollectionOfComplexTypes() {
        encoder.outputFormatting = .prettyPrinted

        let carOne = Car(
            name: "McLaren F1",
            model: .init(name: "F1"),
            manufacturer: .init(name: "McLaren"),
            availableColors: ["red", "silver"]
        )

        let carTwo = Car(
            name: "Porsche 911",
            model: .init(name: "911"),
            manufacturer: .init(name: "Porsche"),
            availableColors: ["red", "yellow"]
        )

        XCTAssertEqual(
            """
            [
              {
                "manufacturer" : {
                  "name" : "McLaren"
                },
                "model" : {
                  "name" : "F1",
                  "engineSizes" : [
                    5000,
                    6000,
                    7000
                  ]
                },
                "availableColors" : [
                  "RED",
                  "SILVER"
                ],
                "name" : "McLaren F1"
              },
              {
                "manufacturer" : {
                  "name" : "Porsche"
                },
                "model" : {
                  "name" : "911",
                  "engineSizes" : [
                    5000,
                    6000,
                    7000
                  ]
                },
                "availableColors" : [
                  "RED",
                  "YELLOW"
                ],
                "name" : "Porsche 911"
              }
            ]
            """,
            stringValue(try encoder.encode([carOne, carTwo], as: .arrayOf(.default)))
        )
    }

    func testUnkeyedEncodingOfValueAttributes() {
        struct Value {
            var a: Int
            var b: String
            var c: Bool
        }

        let value = Value(a: 1, b: "A", c: true)

        let encoding: Encoding<Value> = .combine(
            Encoding<Int>.singleValue.pullback(\.a),
            Encoding<String>.singleValue.pullback(\.b),
            Encoding<Bool>.singleValue.pullback(\.c)
        )

        XCTAssertEqual(
            """
            [1,"A",true]
            """,
            stringValue(try encoder.encode(value, as: encoding))
        )
    }

    func testEncodingOfValueAttributesAsArrayOfIndividualObjects() {
        struct Value {
            var a: Int
            var b: String
            var c: Bool
        }

        enum ValueKeys: CodingKey {
            case a, b, c
        }

        let value = Value(a: 1, b: "A", c: true)

        let encoding: Encoding<Value> = .combine(
            Encoding<Int>.withKey(ValueKeys.a).pullback(\.a),
            Encoding<String>.withKey(ValueKeys.b).pullback(\.b),
            Encoding<Bool>.withKey(ValueKeys.c).pullback(\.c)
        )

        XCTAssertEqual(
            """
            [{"a":1},{"b":"A"},{"c":true}]
            """,
            stringValue(try encoder.encode(value, as: encoding))
        )
    }

    // MARK: - Encoding Property Wrapper

    func testEncodingPropertyWrapper() {
        struct User: Encodable {
            @UsesEncoding(.lowercased)
            var id: UUID = UUID()

            @UsesEncoding(.lowercased)
            var name: String = ""

            @UsesEncoding(.arrayOf(.lowercased))
            var hobbies: [String] = []
        }

        encoder.outputFormatting = .prettyPrinted

        let user = User(
            id: UUID(uuidString: "3B0B3AFC-4C61-4251-8FC5-F046D06DC3EC")!,
            name: "Joe Bloggs",
            hobbies: ["Poker", "Cycling"]
        )

        XCTAssertEqual(
            """
            {
              "id" : "3b0b3afc-4c61-4251-8fc5-f046d06dc3ec",
              "name" : "joe bloggs",
              "hobbies" : [
                "poker",
                "cycling"
              ]
            }
            """,
            stringValue(try encoder.encode(user))
        )
    }

    private func stringValue(_ data: Data) -> String {
        String(data: data, encoding: .utf8)!
    }
}

// MARK: - Test encodings

struct Car {
    var name: String
    var model: Model
    var manufacturer: Manufacturer
    var availableColors: [String]

    enum CodingKeys: CodingKey {
        case name
        case model
        case manufacturer
        case availableColors
    }
}

struct Model {
    var name: String
    var engineSizes = [5000, 6000, 7000]

    enum CodingKeys: CodingKey {
        case name
        case engineSizes
    }
}

struct Manufacturer {
    var name: String

    enum CodingKeys: CodingKey {
        case name
    }
}

extension Encoding where Value == String {
    static let lowercased: Self = Encoding<String>
        .singleValue
        .pullback { $0.lowercased() }
}

extension Encoding where Value == UUID {
    static let lowercased: Self = Encoding<String>
        .lowercased
        .pullback { $0.uuidString }
}

extension Encoding where Value == Manufacturer {
    static let name: Self = Encoding<String>
        .withKey(Model.CodingKeys.name)
        .pullback(\.name)

    static let `default`: Self = .combineWithKeys(
        Manufacturer.CodingKeys.self,
        name
    )
}

extension Encoding where Value == Model {
    static let name: Self = Encoding<String>
        .withKey(Model.CodingKeys.name)
        .pullback(\.name)

    static let engineSizes: Self = Encoding<[Int]>
        .withKey(Model.CodingKeys.engineSizes)
        .pullback(\.engineSizes)

    static let `default`: Self = .combineWithKeys(
        Model.CodingKeys.self,
        name,
        engineSizes
    )
}

extension Encoding where Value == Car {
    static let name: Self = Encoding<String>
        .withKey(Car.CodingKeys.name)
        .pullback(\.name)

    static let model: Self = Encoding<Model>
        .default
        .withKey(Car.CodingKeys.model)
        .pullback(\.model)

    static let manufacturer: Self = Encoding<Manufacturer>
        .default
        .withKey(Car.CodingKeys.manufacturer)
        .pullback(\.manufacturer)

    static let colors: Self = Encoding<[String]>
        .arrayOf(.singleValue.pullback { $0.uppercased() })
        .withKey(Car.CodingKeys.availableColors)
        .pullback(\.availableColors)

    static let `default`: Self = .combineWithKeys(
        Car.CodingKeys.self,
        name,
        model,
        manufacturer,
        colors
    )
}
