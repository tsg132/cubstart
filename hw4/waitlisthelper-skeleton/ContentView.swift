//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
        //YOUR CODE HERE (NavView)//
        NavigationView {
            //YOUR CODE HERE (TabView)//
            TabView {
                ZStack {
                    //YOUR CODE HERE (background)//
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        //YOUR CODE HERE (title)//
                        Text("WILL YOU GET OFF THE WAITLIST?")
                            .font(.largeTitle.bold())
                        
                        Spacer()
                        
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Place on Waitlist: \(waitlistPlace, specifier: "%.f")")
                            Spacer()
                        }
                        
                        //YOUR CODE HERE (slider)//
                        Slider(value: $waitlistPlace, in: 0...200, step: 1)
                            .padding()
                            .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(Color.blue, lineWidth: 2))
                        
                        
                        HStack {
                            //YOUR CODE HERE (description)//
                            Text("Class Size: \(classSize, specifier: "%.f")")
                            Spacer()
                        }
                        //YOUR CODE HERE (slider)//
                        
                        Slider(value: $classSize, in: 0...1000, step: 1)
                            .padding()
                            .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)).stroke(Color.blue, lineWidth: 2))
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("CALCULATE") {
                            //YOUR CODE HERE (calculate)//
                            calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                            text = getFeedbackText()
                            calculate = true
                            
                        }
                        .buttonStyle(CustomButton())
                        
                        Spacer()
                        
                    } .padding()
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                //DIY VIEW GOES HERE//
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text("MY CLASSES")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.black)
                                .padding()
                            Spacer()
                        }
                        .padding()
                        
                        Spacer()
                        
                        HStack {
                            VStack {
                                Text("Class Name 1").font(.title2.bold())
                                Text("Probability : 50%")
                            }
                            .padding()
                            Spacer()
                        }
                        .background(.cyan)
                        .cornerRadius(10)
                        .padding()
                        
                        HStack {
                            VStack {
                                Text("Class Name 2").font(.title2.bold())
                                Text("Probability : 70%")
                            }
                            .padding()
                            Spacer()
                        }
                        .background(.cyan)
                        .cornerRadius(10)
                        .padding()
                        
                        HStack {
                            VStack {
                                Text("Class Name 3").font(.title2.bold())
                                Text("Probability : 10%")
                            }
                            .padding()
                            Spacer()
                        }
                        .background(.cyan)
                        .cornerRadius(10)
                        .padding()
                        
                        HStack {
                            VStack {
                                Text("Class Name 4").font(.title2.bold())
                                Text("Probability : 10%")
                            }
                            .padding()
                            Spacer()
                        }
                        .background(.cyan)
                        .cornerRadius(10)
                        .padding()
                        
                        HStack {
                            Text("Atahan Ozdemir").font(.title2.bold())
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("3037147825").font(.title3)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 90)
                        Spacer()
                    }
                    
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
        }
        
        
    }
    
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        //YOUR CODE HERE//
        let tenth = classSize / 10
        if  (waitlistPlace <= tenth) {
            probability = 100
        } else if (waitlistPlace > tenth * 2) {
            probability = 0
        } else {
            probability = 100 - Int(((Float(waitlistPlace - tenth) / Float(tenth))*100))
        }
        
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {
        
        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                    .navigationBarHidden(true)
                    Spacer()
                }
                .padding()
                
                Spacer()
                Text("PROBABILITY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
        
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        //YOUR CODE HERE (button style)//
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.green : Color.cyan)
            .cornerRadius(10).font(.headline)
            .shadow(color: .black, radius: 2)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
