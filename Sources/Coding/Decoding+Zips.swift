import Foundation

public func zip<A, B, C>(
    _ a: Decoding<A>,
    _ b: Decoding<B>,
    _ c: Decoding<C>
) -> Decoding<(A, B, C)> {
    zip(zip(a, b), c).map { ($0.0, $0.1, $1) }
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
    zip(zip(a, b), c, d).map { ($0.0, $0.1, $1, $2) }
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
    zip(zip(a, b), c, d, e).map { ($0.0, $0.1, $1, $2, $3) }
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
    zip(zip(a, b), c, d, e, f).map { ($0.0, $0.1, $1, $2, $3, $4) }
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
    zip(zip(a, b), c, d, e, f, g).map { ($0.0, $0.1, $1, $2, $3, $4, $5) }
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
    zip(zip(a, b), c, d, e, f, g, h).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6) }
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
    zip(zip(a, b), c, d, e, f, g, h, i).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7) }
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
