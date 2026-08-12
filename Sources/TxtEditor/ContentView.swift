import SwiftUI

struct ContentView: View {
    @Binding var document: TxtDocument

    var body: some View {
        TextEditor(text: $document.text)
            .font(.body.monospaced())
            .padding(8)
            .frame(minWidth: 600, minHeight: 400)
    }
}
