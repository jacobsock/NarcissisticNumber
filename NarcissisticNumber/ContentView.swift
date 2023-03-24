//
//  ContentView.swift
//  NarcissisticNumber
//
//  Created by Jacob Sock on 3/24/23.
//

import SwiftUI
struct ContentView: View {
    @State var numberInput = ""
    @State var isNarcissisticNumber = false
    var body: some View {
        VStack {
            Text(" Narcissistic Number  Calculator ").font(.largeTitle)
            Text("A Narcissistic Number (or Armstrong Number) is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).").font(.body)
            Text("Directions:").font(.title)
            Text("Input a number below").font(.body)
            VStack{
                TextField("Input Number", text: $numberInput).padding(.all)
                    .fontWeight(.bold).font(.headline)
                    .background(Color.teal)
                    .cornerRadius(10)
            
                Button {
                    
                    isNarcissisticNumber = isNarcissistic(Int64(numberInput)!)
                    
                } label: {
                    Text("Check if Narcissistic Number")
                }
                
                .padding(.all).background(.gray).cornerRadius(10).opacity(0.5)
                
                Button {

                    numberInput = ""
                    isNarcissisticNumber = false

                } label: {
                    Text("Clear input")
                }.padding(.all).background(.gray).cornerRadius(10).opacity(0.5)
        
                
                isNarcissisticNumber ? Text("Number is Narcissistic").underline(true, color: . green) : Text("Number is Not Narcissistic").underline(true, color: . red)
                
            }
            .padding()
            
        }
    
    }
}

extension ContentView{
    
    ///This function expects an 'Int64' type argument 'n'.
    ///The function determines if the function is a Narcissitic Number, aka an Armstrong number and returns true or false.
    func isNarcissistic(_ n: Int64) -> Bool {
      var sum : Int64 = 0
      let power = String(n).count
      //The number is first converted to a string
      //.compactMap is then used on each character with the new Character property wholeNumberValue to convert back to Int
      //Each int is then iterated over and added to the sum, with power being the number of digits in n
      String(n).compactMap{ $0.wholeNumberValue }.compactMap{ number in
        var square = int64Pow(Int64(number), Int64(power))
        sum += square
      }
      return sum == n ? true : false;
    }

    ///This function is leveraged because swift's built in pow function expects 'Double' types as arguements.
    ///This function allows us to take the power of Int64 types -- which is important when taking the power of very large numbers.
    func int64Pow (_ base:Int64, _ power:Int64) -> Int64 {
      var answer : Int64 = 1
      for _ in 0..<power { answer *= base }
      return answer
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
