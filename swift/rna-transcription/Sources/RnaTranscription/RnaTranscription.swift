//Solution goes in Sources
struct RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}

struct Nucleotide {
    /// Caches the RNA compliment of our nucleotide
    private let complementNucleotide: String

    /**
     Creates a `DNA` based on a supplied `strand`, if any invalid characters are found, `nil` is returned

     - parameter strand: The `DNA` sequence to split
     */
    init(_ strand: String) throws {
        complementNucleotide = try strand.reduce("") { strand, nucleotide in
            let compliment = try nucleotide.rnaCompliment()
            return strand + String(compliment)
        }
    }

    /**
     Returns a pre-calculated RNA complement

     - returns: A `String` representing the RNA complement of the `strand` provided during initialization
     */
    func complementOfDNA() -> String {
        return complementNucleotide
    }
}

// MARK: - Character+RNACompliment
fileprivate extension Character {
    // Static properties so we can avoid re-creating the storage each time a `DNA` is created
    static let A: Character = "A"
    static let C: Character = "C"
    static let G: Character = "G"
    static let T: Character = "T"
    static let U: Character = "U"

    /**
     Calculates the RNA compliment of a given
     */
    func rnaCompliment() throws -> Character {
        switch self {
        case .A: return .U
        case .C: return .G
        case .G: return .C
        case .T: return .A

        default:
            throw RnaTranscription.TranscriptionError.invalidNucleotide("\(self) is not a valid Nucleotide")
        }
    }
}
