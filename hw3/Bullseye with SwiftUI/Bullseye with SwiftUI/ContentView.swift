//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

import SwiftUI


struct ContentView: View {
    @State var num: Double = 50
        
    @State var toggle = false
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
            }
            Spacer()
            Text("Move the slider to")
            Text("25")
            Slider(value: $num, in: 0...100)
            Button(action: {print("check")}){
                Text("check")
            }
            Toggle("Exact Mode?", isOn: $toggle)
            }

            
        }
    }

