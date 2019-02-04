//Solution goes in Sources
import Foundation

struct Triangle {
    enum TriangleKind: String {
        case equilateral = "Equilateral"
        case isosceles = "Isosceles"
        case scalene = "Scalene"
        case errorKind = "ErrorKind"
        case degenerate = "Degenerate"
    }

    var kind: String {
        return triangleKind.rawValue
    }

    private let triangleKind: TriangleKind

    init(_ s1: Float, _ s2: Float, _ s3: Float) {
        if s1 <= 0 || s2 <= 0 || s3 <= 0 {
            self.triangleKind = .errorKind
        } else if (s1 + s2) <= s3 || (s2 + s3) <= s1 || (s1 + s3) <= s2 {
            if abs((s1 + s2) - s3) < Float.ulpOfOne || abs((s2 + s3) - s1) < Float.ulpOfOne || abs((s1 + s3) - s2) < Float.ulpOfOne {
                self.triangleKind = .degenerate
            } else {
                self.triangleKind = .errorKind
            }
        } else if abs(s1 - s2) < Float.ulpOfOne {
            if abs(s2 - s3) < Float.ulpOfOne {
                self.triangleKind = .equilateral
            } else {
                self.triangleKind = .isosceles
            }
        } else if abs(s2 - s3) < Float.ulpOfOne { // At least one side unequal
            self.triangleKind = .isosceles
        } else if abs(s1 - s3) < Float.ulpOfOne {
            self.triangleKind = .isosceles
        } else {
            self.triangleKind = .scalene
        }
    }
}
