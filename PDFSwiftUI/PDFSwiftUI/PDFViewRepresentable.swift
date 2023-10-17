//
//  PDFViewRepresentable.swift
//  PDFSwiftUI
//
//  Created by Nataly on 15.10.2023.
//

import SwiftUI
import PDFKit

struct PDFViewRepresentable: UIViewRepresentable {
    @Binding var document: PDFDocument?
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = document
    }
}

struct PDFViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        PDFViewRepresentable(document: .constant(PDFDocument()))
    }
}
