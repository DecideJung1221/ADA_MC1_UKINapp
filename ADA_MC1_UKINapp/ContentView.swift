import SwiftUI

struct ContentView: View {
    @State var showHomeView = false
    
    var body: some View {
        ZStack{
            //            Color(Color.customBackgroundsky).ignoresSafeArea()
            if showHomeView {
                Text("showHomeView")
                homeTabView(showHomeView: self.$showHomeView)
//                    .environment(store)
            } else {
                VStack{
                    Image("MOA")
                        .offset(y:-100)
                    Button(action: {
                        self.showHomeView = true
                    }) {
                        Text("start")
                            .font(.title)
                            .foregroundStyle(Color(.black))
                    }
                    .offset(y:80)
                    Image("moa_human")
                        .offset(y:100)
                }
                
            }
        }
    }
}
