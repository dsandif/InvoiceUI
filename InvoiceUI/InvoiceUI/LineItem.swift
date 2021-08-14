//
//  LineItem.swift
//  InvoiceUI
//
//  Created by Darien Sandifer on 8/14/21.
//

import Foundation
import CoreGraphics

struct LineItem: Identifiable{
    var id: UUID = UUID()
    var quantity: CGFloat
    var name: String
    var note: String?
    var amount: CGFloat
    var quantityType: String
}
