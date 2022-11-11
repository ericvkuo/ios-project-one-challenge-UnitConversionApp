//
//  ContentView.swift
//  UnitConversions
//
//  Created by Eric Kuo on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var conversionType = "Temperature"
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var inputNumber = 0.0
    @FocusState private var numberIsFocused: Bool
    //@State private var
    let conversionLists = ["Temperature", "Length", "Time", "Volume"]
    let temperatureConversions = ["", "Celsius", "Fahrenheit", "Kelvin"]
    let lengthConversions = ["", "centimeters", "meters", "kilometers", "inches", "feet", "miles"]
    let timeConversions = ["", "seconds", "minutes", "hours", "days"]
    let volumeConversions = ["", "mililiters", "liters", "cups", "pints", "gallons"]
    
    var finalConversion: Double {
        var finalConversion = 0.0
        if conversionType == conversionLists[0] {
            var tempInCelsius = inputNumber
            if inputUnit == temperatureConversions[1] {
                tempInCelsius = inputNumber
            }
            else if inputUnit == temperatureConversions[2] {
                tempInCelsius = (inputNumber - 32) * 5 / 9
            }
            else if inputUnit == temperatureConversions[3] {
                tempInCelsius = inputNumber - 273.15
            }
            else {}
            
            if outputUnit == temperatureConversions[1] {
                finalConversion = tempInCelsius
            }
            else if outputUnit == temperatureConversions[2] {
                finalConversion = tempInCelsius * 9 / 5 + 32
            }
            else if outputUnit == temperatureConversions[3] {
                finalConversion = tempInCelsius + 273.15
            } else {}
            
        } else {}
        
        return finalConversion
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Conversion Type", selection: $conversionType) {
                        ForEach(conversionLists, id: \.self) {
                            Text($0)
                        }
                    }
                }
                if conversionType == "Temperature" {
                    Section {
                        Picker("input unit", selection: $inputUnit) {
                            ForEach(temperatureConversions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("output unit", selection: $outputUnit) {
                            ForEach(temperatureConversions, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Choose your units")
                    }
                }
                else if conversionType == "Length" {
                    Section {
                        Picker("input unit", selection: $inputUnit) {
                            ForEach(lengthConversions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("output unit", selection: $outputUnit) {
                            ForEach(lengthConversions, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Choose your units")
                    }
                }
                else if conversionType == "Time" {
                    Section {
                        Picker("input unit", selection: $inputUnit) {
                            ForEach(timeConversions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("output unit", selection: $outputUnit) {
                            ForEach(timeConversions, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Choose your units")
                    }
                }
                else if conversionType == "Volume" {
                    Section {
                        Picker("input unit", selection: $inputUnit) {
                            ForEach(volumeConversions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("output unit", selection: $outputUnit) {
                            ForEach(volumeConversions, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Choose your units")
                    }
                }
                else {
                    
                }
                
                Section {
                    TextField("", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                } header: {
                    Text("Enter a value")
                }
                
                
                Section {
                    Text("\(finalConversion, format: .number) \(outputUnit)")
                } header: {
                    Text("Your conversion")
                }
                
                
            }
            .navigationTitle("EZ Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        numberIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
