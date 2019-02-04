//Solution goes in Sources
import Foundation

enum Plant: Character {
    case radishes = "R"
    case clover = "C"
    case grass = "G"
    case violets = "V"

    static func plants(for sequence: String) -> [Plant] {
        return sequence.compactMap(Plant.init(rawValue:))
    }
}

struct Garden {
    private let layout: (top: String, bottom: String)
    private let childToIndex: [String: Int]

    init(_ layout: String, children: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]) {
        let layoutLines = layout.components(separatedBy: "\n")
        precondition(layoutLines.count == 2)
        precondition(layoutLines.first!.count <= children.count * 2)
        precondition(layoutLines.last!.count <= children.count * 2)
        self.layout = (top: layoutLines.first!, bottom: layoutLines.last!)
        self.childToIndex = Dictionary(zip(children.sorted(), children.indices)) { lhs, _ in lhs } // Ignore duplicates
    }

    func plantsForChild(_ name: String) -> [Plant] {
        guard let childIndex = childToIndex[name] else { return [] }
        // These indicies are guaranteed to work given the `precondition`s in `init`
        let plantStartIndex = childIndex * 2
        let plantRange = plantStartIndex ..< plantStartIndex + 2
        return Plant.plants(for: layout.top[plantRange] + layout.bottom[plantRange])
    }
}

extension String {
    func index(at offset: Int) -> String.Index {
        return index(startIndex, offsetBy: offset)
    }

    subscript(_ range: Range<Int>) -> String {
        let stringIndexRange = index(at: range.lowerBound)..<index(at: range.upperBound)
        return String(self[stringIndexRange])
    }
}
