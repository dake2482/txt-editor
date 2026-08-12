import SwiftUI

@main
struct TxtEditorApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TxtDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
