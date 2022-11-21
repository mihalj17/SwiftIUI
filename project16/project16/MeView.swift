//
//  MeView.swift
//  project16
//
//  Created by Matko Mihaljl on 03.10.2022..
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CoreImage

struct MeView: View {
    @State private var name = "Anonymus"
    @State private var emailAddress = "you@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your code")
        }
    }
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmaark.circle") ?? UIImage()
    }
}


struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
