import Foundation
import SwiftUI

public extension Color {
    public init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        var r, g, b, a: UInt64

        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (rgb >> 8) * 17,
                            (rgb >> 4 & 0xF) * 17,
                            (rgb & 0xF) * 17
            )
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            (rgb >> 16),
                            (rgb >> 8 & 0xFF),
                            (rgb & 0xFF)
            )
        case 8: // ARGB (34-bit)
            (a, r, g, b) = ((rgb >> 24),
                            (rgb >> 16 & 0xFF),
                            (rgb >> 8 & 0xFF),
                            (rgb & 0xFF)
            )
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
