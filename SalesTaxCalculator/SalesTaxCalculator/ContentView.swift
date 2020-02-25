//
//  ContentView.swift
//  SalesTaxCalculator
//
//  Created by Adnan Joraid on 2020-02-24.
//  Copyright © 2020 Adnan Joraid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // inintilzing lists for the calculations computed property.
    let provTaxesFinalValue = [1.05, 1.12, 1.12, 1.15, 1.15, 1.15, 1.13, 1,15, 1,14975, 1.15]
    let taxAmount = [0.05, 0.12, 0.12, 0.15, 0.15, 0.15, 0.13, 0.15, 0.14975, 0.15]
    let prov = ["Alberta 5%","British Columbia 12%", "Manitoba 12%", "New Burnswick 15%", "Newfoundland and labrador 15%","Nova Scotia 15%","Ontario 13%","Prince Edward Island 15%","Quebec 14.975%","Saskatchewan 5%"]
    // states variable to 'watch over' the user interactions
    @State private var currentProv = 0
    @State private var amount = ""
    
    //calculate the tax amount only
    var taxCalculations : Double{
        return (Double(amount) ?? 0.0) * (taxAmount[currentProv])
        
    }
    // adding the tax amount to the original value -> final amount
    var calculationsWtihTax : Double{
        //enter all calculations here
        
        return (Double(amount) ?? 0.0) + taxCalculations
        
    }
    
    
    var body: some View {
        
        NavigationView{ //presenting stacks of the view
            Form{ // forms to hold many sections
                Section(header: Text("Select a province")){ //sections for each part
                    Picker("Province", selection: $currentProv){
                        
                        ForEach( 0..<self.prov.count){ //iterating over the prov list
                            Text(self.prov[$0]).tag($0)
                        }
                    }
                }
                
                Section(header: Text("Enter An Amount")){
                    TextField("Amount", text: $amount).keyboardType(.decimalPad)
                }
                
                Section(header: Text("HST/GST")){
                    Text("\(self.taxCalculations, specifier: "%.2f")").keyboardType(.decimalPad)
                    
                }
                
                Section(header: Text("Total Amount")){
                    Text("\(self.calculationsWtihTax, specifier: "%.2f")").keyboardType(.decimalPad)
                }
            }
                
                .navigationBarTitle("Sales Tax Calculator") // app title
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
