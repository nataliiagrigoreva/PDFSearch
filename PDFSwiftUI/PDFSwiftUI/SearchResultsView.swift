//
//  SearchResultsView.swift
//  PDFSwiftUI
//
//  Created by Nataly on 15.10.2023.
//

import SwiftUI
import PDFKit

struct SearchResultsView: View {
    let searchResults: [PDFSelection]
    @Binding var isSearching: Bool
    @State private var selectedPage: String? = nil
    
    var body: some View {
        List(searchResults, id: \.description) { selection in
            Button(action: {
                showSelection(selection)
            }) {
                Text("Страница \(selection.pages.first?.label ?? "")")
            }
        }
        .onAppear {
            isSearching = false
        }
    }
    
    private func showSelection(_ selection: PDFSelection) {
            if let page = selection.pages.first {
                selectedPage = page.label
            }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchResults: [], isSearching: .constant(false))
    }
}
