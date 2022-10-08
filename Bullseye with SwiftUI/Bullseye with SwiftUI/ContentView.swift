//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue : Double = 0.0
    @State var toggle = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
            
            Spacer()
            
            Text("Move the slider to: ")
            Text("25")
            Slider(value: $sliderValue, in:0...100)
                .padding()
            
            Text("Check")
            
            Spacer()
            
            Text("Exact mode?")
            Toggle("Hi", isOn:$toggle)
                .labelsHidden()
        }
    }
}
