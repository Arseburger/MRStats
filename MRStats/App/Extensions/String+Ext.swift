import Foundation
import RegexBuilder

extension String {
    func clean() -> String {
        let regex = Regex { "<"; OneOrMore { CharacterClass(.anyOf("._%+-/"), ("A"..."Z"), ("0"..."9"), ("a"..."z")) }; ">" }
        return self.replacing(regex, with: "\"")
    }
}
