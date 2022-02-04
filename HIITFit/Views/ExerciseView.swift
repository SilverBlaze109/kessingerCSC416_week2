import SwiftUI
import AVKit

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    let interval: TimeInterval = 30
    @State private var showAlert = false
    var body: some View {
        GeometryReader {
            geometry in
            VStack
            {
                HeaderView(exerciseName: exerciseNames[index])
                    .padding(.bottom)
                
                if let url = Bundle.main.url( forResource: videoNames[index], withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url)).frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(videoNames[index]).mp4").foregroundColor(.red)
                }
                
                Text(Date()
                        .addingTimeInterval(interval), style: .timer)
                    .font(.system(size:90))
                    .background(Rectangle().foregroundColor(.black).cornerRadius(15)
                    )
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    
                
                Button("Start/Done")
                {
                    
                }
                    .font(.title3)
                    .padding()
                
                RatingView()
                    .padding()
                
                Spacer()
                Button("History")
                {
                    showAlert = true
                }
                    .alert(isPresented: $showAlert)
                {
                    Alert(title: Text("There is no history to show."))
                }
                    .padding(.bottom)
        }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}
