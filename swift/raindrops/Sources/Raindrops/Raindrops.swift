//Solution goes in Sources
struct Raindrops {
    let sounds: String

    init(_ count: Int) {
        var sounds = ""
        if count % 3 == 0 {
            sounds.append("Pling")
        }
        if count % 5 == 0 {
            sounds.append("Plang")
        }
        if count % 7 == 0 {
            sounds.append("Plong")
        }
        if sounds.isEmpty {
            sounds = String(count)
        }
        self.sounds = sounds
    }
}
