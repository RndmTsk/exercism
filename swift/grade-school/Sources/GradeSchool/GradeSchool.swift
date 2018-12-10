//Solution goes in Sources
struct GradeSchool {
    private(set) var roster = [Int: [String]]()

    var sortedRoster: [Int: [String]] {
        // Sort each class, dictionaries can't be "sorted"
        return roster.mapValues { $0.sorted() }
        /* Alternatively:
         var sortedRoster: [Int: [String]] = [:]
         roster.forEach { key, value in
            sortedRoster[key] = value.sorted()
         }
         return sortedRoster
         */
    }

    mutating func addStudent(_ name: String, grade: Int) {
        roster[grade, default: []].append(name)
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade, default: []]
    }
}
