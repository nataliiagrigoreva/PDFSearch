//
//  ContentView.swift
//  ContentView
//
//  Created by Nataly on 17.10.2023.
//
import SwiftUI
import PDFKit

struct ContentView: View {
    @State private var pdfDocument: PDFDocument?
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var searchResults: [PDFSelection] = []
    
    var body: some View {
        VStack {
            TextField("Поиск", text: $searchText)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding()
            
            Button(action: {
                loadPDFDocument()
            }) {
                Text("Обновить")
            }
            .padding()
            
            if isSearching {
                ProgressView("Идет поиск...")
            }
            
            if let pdfDocument = pdfDocument {
                PDFViewRepresentable(document: $pdfDocument)
                    .onTapGesture {
                        hideKeyboard()
                    }
            }
            
            if !searchResults.isEmpty {
                SearchResultsView(searchResults: searchResults, isSearching: $isSearching)
            }
        }
    }
    
    private func loadPDFDocument() {
        if let pdfURL = Bundle.main.url(forResource: "A320-Part3", withExtension: "pdf") {
            pdfDocument = PDFDocument(url: pdfURL)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
