
import SwiftUI

struct PropertyCard: View {
    
    var property: Property
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(property.key)
                .font(.system(size: 14))
                .foregroundColor(.captionGrey)
            Text(property.value)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .fontWeight(.semibold)
        }.frame(maxWidth: UIScreen.main.bounds.width / 2, alignment: .leading)
    }
}
