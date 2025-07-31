import SwiftUI

public extension View {
    @ViewBuilder
    func debugBorder(_ color: Color = .random) -> some View {
#if DEBUG
        self.border(color)
#else
        self
#endif
    }

    @ViewBuilder
    func debugBackground(_ color: Color = .random) -> some View {
#if DEBUG
        self.background(color)
#else
        self
#endif
    }
}
