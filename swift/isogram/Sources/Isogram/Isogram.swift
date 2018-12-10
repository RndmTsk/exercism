//Solution goes in Sources
struct Isogram {
    static let space: Character = " "
    static let hyphen: Character = "-"

    static func isIsogram(_ word: String) -> Bool {
        var existingCharacters = Set<String>()
        for character in word {
            guard character != Isogram.space && character != Isogram.hyphen else { continue }
            // It's expensive to create `String`s from each `Character`, but it's difficult to translate lower/upper case letters otherwise
            let characterString = String(character).lowercased()
            let (inserted, _) = existingCharacters.insert(characterString)
            if !inserted { return false }
        }
        return true
    }
}
