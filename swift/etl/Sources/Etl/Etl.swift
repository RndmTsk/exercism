//Solution goes in Sources
struct ETL {
    static func transform(_ oldFormat: [Int: [String]]) -> [String: Int] {
        // Assumptions:
        //   - Letters cannot have multiple point values (i.e. "A" isn't worth 2 _and_ 4)
        var result = [String: Int]()
        for (score, letters) in oldFormat {
            for letter in letters {
                result[letter.lowercased()] = score
            }
        }
        return result
    }
}
