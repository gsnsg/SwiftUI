//
//  ContentView.swift
//  Challenge1
//
//  Created by Nikhi on 03/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var input: String = ""
    @State private var inputUnit: Int = 2
    @State private var outputUnit: Int = 2
    
    let units = ["meters", "kilometers", "foot", "yards", "miles"]
    
    
    let conversions: [[Double]] = [
        [1.0, 0.001, 3.28084, 1.09361, 0.00062],
        [1000, 1.0, 3280.84, 1093.61, 0.621],
        [0.3048, 0.000304, 1.0, 0.333333, 0.000189],
        [0.9144, 0.0009144, 3.0, 1.0, 0.000568182],
        [1609.34, 1.60934, 5279.98687656, 1759.99, 1.0]
    ]
    
    var convertedUnit: Double {
        if let val = Double(input) {
            return val * conversions[inputUnit][outputUnit]
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Length", text: $input)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Input Unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Text("\(convertedUnit, specifier: "%.4f") \(units[outputUnit])")
                }
            }.navigationBarTitle("Convert It!")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
