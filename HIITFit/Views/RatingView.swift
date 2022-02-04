import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                Image(systemName: "waveform.path.ecg").foregroundColor(.gray).font(.largeTitle)
                    .background(Circle().foregroundColor(Color(red: 1, green: 0.349, blue: 0.349)))
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView().previewLayout(.sizeThatFits)
    }
}
