//Solution goes in Sources

struct Squares {
    let squareOfSum: Int
    let sumOfSquares: Int
    let differenceOfSquares: Int

    init(_ limit: Int) {
        let range = 1...limit
        let sum = range.reduce(0, +)
        squareOfSum = sum * sum
        sumOfSquares = range.reduce(0) { $0 + $1 * $1 }
        differenceOfSquares = squareOfSum - sumOfSquares
    }
}
