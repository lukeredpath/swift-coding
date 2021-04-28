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

public func zip<A, B, Output>(
    with f: @escaping (A, B) -> Output) -> (
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

public func zip<A, B, C, Output>(
    with f: @escaping (A, B, C) -> Output) -> (
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

public func zip<A, B, C, D, Output>(
    with f: @escaping (A, B, C, D) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3).map(f) }
}

public func zip<A, B, C, D, E>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>,
    _ e: Decoding<E>
) -> Decoding<(A, B, C, D, E)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder),
            e.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, E, Output>(
    with f: @escaping (A, B, C, D, E) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>,
    Decoding<E>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3, $4).map(f) }
}

public func zip<A, B, C, D, E, F>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>,
    _ e: Decoding<E>,
    _ f: Decoding<F>
) -> Decoding<(A, B, C, D, E, F)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder),
            e.decode(decoder),
            f.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, E, F, Output>(
    with f: @escaping (A, B, C, D, E, F) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>,
    Decoding<E>,
    Decoding<F>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3, $4, $5).map(f) }
}

public func zip<A, B, C, D, E, F, G>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>,
    _ e: Decoding<E>,
    _ f: Decoding<F>,
    _ g: Decoding<G>
) -> Decoding<(A, B, C, D, E, F, G)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder),
            e.decode(decoder),
            f.decode(decoder),
            g.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, E, F, G, Output>(
    with f: @escaping (A, B, C, D, E, F, G) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>,
    Decoding<E>,
    Decoding<F>,
    Decoding<G>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3, $4, $5, $6).map(f) }
}

public func zip<A, B, C, D, E, F, G, H>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>,
    _ e: Decoding<E>,
    _ f: Decoding<F>,
    _ g: Decoding<G>,
    _ h: Decoding<H>
) -> Decoding<(A, B, C, D, E, F, G, H)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder),
            e.decode(decoder),
            f.decode(decoder),
            g.decode(decoder),
            h.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, E, F, G, H, Output>(
    with f: @escaping (A, B, C, D, E, F, G, H) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>,
    Decoding<E>,
    Decoding<F>,
    Decoding<G>,
    Decoding<H>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3, $4, $5, $6, $7).map(f) }
}

public func zip<A, B, C, D, E, F, G, H, I>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>,
    _ d: Decoding<D>,
    _ e: Decoding<E>,
    _ f: Decoding<F>,
    _ g: Decoding<G>,
    _ h: Decoding<H>,
    _ i: Decoding<I>
) -> Decoding<(A, B, C, D, E, F, G, H, I)> {
    .init { decoder in
        try (
            a.decode(decoder),
            b.decode(decoder),
            c.decode(decoder),
            d.decode(decoder),
            e.decode(decoder),
            f.decode(decoder),
            g.decode(decoder),
            h.decode(decoder),
            i.decode(decoder)
        )
    }
}

public func zip<A, B, C, D, E, F, G, H, I, Output>(
    with f: @escaping (A, B, C, D, E, F, G, H, I) -> Output) -> (
    Decoding<A>,
    Decoding<B>,
    Decoding<C>,
    Decoding<D>,
    Decoding<E>,
    Decoding<F>,
    Decoding<G>,
    Decoding<H>,
    Decoding<I>
) -> Decoding<Output> {
    { zip($0, $1, $2, $3, $4, $5, $6, $7, $8).map(f) }
}
