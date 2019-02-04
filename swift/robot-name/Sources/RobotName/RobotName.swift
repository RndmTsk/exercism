//Solution goes in Sources
class Robot {
    // MARK: - Static Properties
    private static var validLetterPrefixes: [String: Bool] = {
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map(String.init)
        let prefixes = (0..<(alphabet.count * alphabet.count)).map { index -> (String, Bool) in
            let firstIndex = index % alphabet.count
            let secondIndex = index / alphabet.count
            return (alphabet[firstIndex] + alphabet[secondIndex], true)
        }
        return Dictionary(prefixes) { first, _ in first }
    }()
    private static var validDigitSuffixes: [Int: Bool] = {
        let digits = (100...999).map { ($0, true) }
        return Dictionary(digits) { first, _ in first }
    }()

    // MARK: - Properties
    private(set) var name: String
    private var prefix: String
    private var suffix: Int

    init() {
        let (prefix, suffix) = Robot.generateName()
        self.name = prefix + String(suffix)
        self.prefix = prefix
        self.suffix = suffix
    }

    deinit {
        // Put it back!
        Robot.validLetterPrefixes[prefix] = true
        Robot.validDigitSuffixes[suffix] = true
    }

    func resetName() {
        Robot.validLetterPrefixes[self.prefix] = true
        Robot.validDigitSuffixes[self.suffix] = true
        let (prefix, suffix) = Robot.generateName()
        self.name = prefix + String(suffix)
        self.prefix = prefix
        self.suffix = suffix
    }

    private static func generateName() -> (String, Int) {
        let availableLetterPrefixes = Robot.validLetterPrefixes.compactMap { $0.value ? $0.key : nil }
        let availableDigitSuffixes = Robot.validDigitSuffixes.compactMap { $0.value ? $0.key : nil }

        let prefix = availableLetterPrefixes[Int.random(in: 0..<availableLetterPrefixes.count)]
        let suffix = availableDigitSuffixes[Int.random(in: 0..<availableDigitSuffixes.count)]
        Robot.validLetterPrefixes[prefix] = false
        Robot.validDigitSuffixes[suffix] = false
        return (prefix, suffix)
    }
}
