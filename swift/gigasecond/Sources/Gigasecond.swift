//Solution goes in Sources

import Foundation

struct Gigasecond {
    fileprivate static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")!
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()

    let date: Date
    let gigasecondDate: Date
    let gigasecond: TimeInterval = 1000000000

    init?(from dateString: String) {
        guard let date = Gigasecond.dateFormatter.date(from: dateString) else {
            return nil
        }
        self.date = date
        self.gigasecondDate = date.addingTimeInterval(gigasecond)
    }
}

extension Gigasecond: CustomStringConvertible {
    var description: String {
        return Gigasecond.dateFormatter.string(from: gigasecondDate)
    }
}
