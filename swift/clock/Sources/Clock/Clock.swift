//Solution goes in Sources
import Foundation

struct Clock: CustomStringConvertible {
    private let minutes: Int

    var description: String {
        let formattedNumbers = hoursAndMinutes()
        return String(format: "%02d:%02d", formattedNumbers.hours, formattedNumbers.minutes)
    }

    init(hours: Int = 0, minutes: Int = 0) {
        var scaledHours = hours
        let scaledMinutes = (minutes < 0 ? 60 : 0) + (minutes % 60)

        scaledHours += (minutes - scaledMinutes) / 60
        if scaledHours < 0 {
            scaledHours = 24 + (scaledHours % 24)
        } else {
            scaledHours %= 24
        }
        self.minutes = scaledHours * 60 + scaledMinutes
    }

    func add(minutes: Int) -> Clock {
        return Clock(minutes: self.minutes + minutes)
    }

    func subtract(minutes: Int) -> Clock {
        return Clock(minutes: self.minutes - minutes)
    }

    private func hoursAndMinutes() -> (hours: Int, minutes: Int) {
        let minutes = self.minutes % 60
        return (((self.minutes - minutes) / 60) % 24, minutes)
    }
}

extension Clock: Equatable {}
