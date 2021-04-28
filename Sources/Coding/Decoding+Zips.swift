import Foundation

public func zip<A, B>(
    _ a: Decoding<A>,
    _ b: Decoding<B>
) -> Decoding<(A, B)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder)
        )
    }
}

public func zip<A, B, Output>(with f: @escaping (A, B) -> Output) -> (
    Decoding<A>,
    Decoding<B>
) -> Decoding<Output> {
    { zip($0, $1).map(f) }
}

public func zip<A, B, C>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>
) -> Decoding<(A, B, C)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder)
        )
    }
}

public func zip<A, B, C, Output>(with f: @escaping (A, B, C) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>
) -> Decoding<Output> {
    { zip($0, $1, $2).map(f) }
}

public func zip<A, B, C, D>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>
) -> Decoding<(A, B, C, D)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, Output>(with f: @escaping (A, B, C, D) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3).map(f) }
}
