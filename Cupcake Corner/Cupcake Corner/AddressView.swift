//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Nikhi on 24/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    
    
   
    var body: some View {
        Form {
            Section {
                TextField("Name", text:$order.name)
                TextField("Stree Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }.disabled(order.hasValidAddress == false)
        }.navigationBarTitle("Delivey details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AddressView(order: order)
    }
}
