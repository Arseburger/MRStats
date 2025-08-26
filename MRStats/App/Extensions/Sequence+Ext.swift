import Foundation

extension Sequence {
    func uniqued(by keySelector: (Element) -> String) -> [Element] {
        var seen = Set<String>()
        return filter { element in
            let key = keySelector(element)
            return seen.insert(key).inserted
        }
    }
}
