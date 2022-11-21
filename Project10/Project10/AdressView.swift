//
//  AdressView.swift
//  Project10
//
//  Created by Matko Mihaljl on 19.09.2022..
//

import SwiftUI

struct AdressView: View {
    @ObservedObject var  order: Order
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Strett aadress", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
                
            }
            Section{
                NavigationLink{
                    CheckoutView(order: order)
                }label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AdressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AdressView(order: Order())
        }
    }
}
