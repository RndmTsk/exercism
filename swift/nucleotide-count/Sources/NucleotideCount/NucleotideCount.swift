//Solution goes in Sources

struct DNA {
    // Static properties so we can avoid re-creating the storage each time a `DNA` is created
    static let A: Character = "A"
    static let C: Character = "C"
    static let G: Character = "G"
    static let T: Character = "T"

    enum Error: Swift.Error {
        case invalidStrand
    }

    /// Caches the counts when the `DNA` is created
    private let strandCounts: [String: Int]

    /**
     Creates a `DNA` based on a supplied `strand`, if any invalid characters are found, `nil` is returned

     - parameter strand: The `DNA` sequence to split
     */
    init?(strand: String) {
        do {
            strandCounts = try strand.reduce(into: ["A": 0, "C": 0, "G": 0, "T": 0]) { counts, letter in
                guard letter == DNA.A || // Avoid using an array so we can short-circuit
                    letter == DNA.C ||
                    letter == DNA.G ||
                    letter == DNA.T
                    else { throw DNA.Error.invalidStrand }
                counts[String(letter), default: 0] += 1
            }
        } catch {
            return nil
        }
    }

    /**
     Returns a read-only version of `strandCounts`

     - returns: A list of counts keyed by DNA strand letter
     */
    func counts() -> [String: Int] {
        return strandCounts
    }

    /**
     Returns a value for the specified strand.

     - returns: The count for a given strand, defaults to `0`.
     */
    func count(_ strand: String) -> Int {
        return strandCounts[strand, default: 0]
    }
}
