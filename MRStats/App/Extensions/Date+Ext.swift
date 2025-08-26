import Foundation

extension Date {
    static func from(year: Int, day: Int, month: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
