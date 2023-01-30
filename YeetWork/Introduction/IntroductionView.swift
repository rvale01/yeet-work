//
//  IntroductionView.swift
//  YeetWork
//
//  Created by Valentina Ronchi on 08/12/2022.
//

import SwiftUI

struct Title: View {
    var text: String;
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726))
            .multilineTextAlignment(.center)
    }
}

struct Description: View {
    var text: String;
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.light)
            .foregroundColor(Color(red: 0.2901960784313726, green: 0.2901960784313726, blue: 0.2901960784313726, opacity: 1.0))
            .multilineTextAlignment(.leading)
    }
}

struct NextButton:  View {
    var onClick: () -> Void;
    var body: some View {
        Button(action: onClick){
            Text("Next")
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.vertical, 20.0)
            .padding(.horizontal, 100.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9647058823529412, green: 0.5764705882352941, blue: 0.34901960784313724)/*@END_MENU_TOKEN@*/)
            .cornerRadius(30)
        }
        
        
    }
}

struct ViewStructure: View {
    var onNext: () -> Void;
    var title: String;
    var description: String;
    var body: some View {
        ZStack{
            Color.init(UIColor(red:255.0/255.0, green:217.0/255.0, blue:194.0/255.0, alpha: 1)
)
            VStack(){
                Title(text: title)
                    .padding([.top], 100)
                Description(text: description)
                    .padding([.top], 50)
                
                Spacer()
                NextButton(onClick: onNext)
                    .padding([.bottom], 100)
            }
            .padding(.horizontal, 30)
        }
        .ignoresSafeArea()
    }

}


struct IntroductionView: View {
    @State private var page: Int = 1;
    
    func onNext() {
        page = page + 1;
    }
    var body: some View {
        VStack{
            switch(page){
            case 1:ViewStructure(onNext:onNext, title: texts[0]["title"] ?? "", description: texts[0]["text"] ?? ""
            );
            case 2: ViewStructure(onNext:onNext, title: texts[1]["title"] ?? "", description: texts[1]["text"] ?? ""
            );
            case 3: ViewStructure(onNext:onNext, title: texts[2]["title"] ?? "", description: texts[2]["text"] ?? ""
            );
            case 4: ViewStructure(onNext:onNext, title: texts[3]["title"] ?? "", description: texts[3]["text"] ?? ""
            );
            case 5: SwitchAuthView();
            default: SwitchAuthView();
            }
        }
    }
}


struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
