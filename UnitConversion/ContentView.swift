//
//  ContentView.swift
//  UnitConversion
//
//  Created by Lucas Amorim on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    // celsius para Farh Done
    // celsius para kelvin Done
    //kelvin para celsius
    // kelvin para farh Done
    // farh para celsius Done
    // farh para kelvin Done
    
    
    
    @State private var inputUser = 0.0
    @State private var outputUser = 0.0
    @State private var unitOutPut = "Farh"
    @State private var unitInput = "Kelvin"
    
  
    
    var celsiusToFarh: Double{
        let convertedValue = (inputUser * 9 / 5) + 32
        
        return convertedValue
    }
    
    var celsiusToKelin: Double {
        let convertedValue = (inputUser + 273.15)
        
        return convertedValue
    }
    
    var kelvinToFarh: Double {
        let convertedValue = (inputUser * 1.8) - 459.67
        
        return convertedValue
        
    }
    
    var farhToCesius: Double{
        let convertedValue = (inputUser - 32) * 5/9
        
        return convertedValue
    }
    
    var farhToKelvin: Double {
        let convertedValue = (inputUser - 32) * 5/9 + 273.15
        
        return convertedValue
    }
    
    var kelvinToCelsius: Double {
        let convertedValue = (inputUser - 273.15)
        
        return convertedValue
    }
    
    var convertFromCelsius: Double{
        switch unitOutPut {
        case selectedUnit[0]:
            return inputUser
        case selectedUnit[1]:
            return celsiusToFarh
        case selectedUnit[2]:
            return celsiusToKelin
        default:
            return 0
        }
    }
    
    var convertFromKelvin: Double{
        switch unitOutPut {
        case selectedUnit[0]:
            return kelvinToCelsius
        case selectedUnit[1]:
            return kelvinToFarh
        case selectedUnit[2]:
            return inputUser
        default:
            return 0
        }
    }
    
    var ConvertFromFarh: Double {
        switch unitInput {
        case selectedUnit[0]:
            return farhToCesius
        case selectedUnit[2]:
            return farhToKelvin
        case selectedUnit[1]:
            return inputUser
        default:
            return 0
        }
    }
    
    //Based on user output
    var convertGeneral: Double{
        switch unitInput{
        case selectedUnit[0]:
            return convertFromCelsius
        case selectedUnit[2]:
            return convertFromKelvin
        case selectedUnit[1]:
            return ConvertFromFarh
        default:
            return 0
        }
    }
    
    let selectedUnit = ["Celsius", "Farh", "Kelvin"]

    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter your value here:", value:$inputUser, format: .number.precision(.significantDigits(1...4)))
                Picker("", selection: $unitInput){
                    ForEach(selectedUnit, id: \.self){
                        Text($0)
                    }
                }
                Section{
                    
                   
                    Picker("", selection: $unitOutPut){
                            ForEach(selectedUnit, id: \.self){
                                Text($0)
                            }
                        }
                 
                        Text("\(convertGeneral)")
                        
                    
                    .pickerStyle(.segmented)
                }
                
            }
            .pickerStyle(.segmented)
            .navigationTitle("Unit of Conversion")
            .navigationBarTitleDisplayMode(.inline)
            
            Section{
                Text("Apple inc.").fontWeight(.bold)
                HStack{
                    Image(systemName: "globe").font(.title3).fontWeight(.bold)
                }
            }
            .frame(width: 100, height: 30)
            .foregroundColor(.accentColor)
            .font(.title3)
            
        }

        }
    }


#Preview {
    ContentView()
        
}
