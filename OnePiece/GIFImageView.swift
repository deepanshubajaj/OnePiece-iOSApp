import SwiftUI
import UIKit

struct GIFImageView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        // Load the GIF data
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
           let source =  CGImageSourceCreateWithData(data as CFData, nil) {
            
            // Get frame count
            let frameCount = CGImageSourceGetCount(source)
            var images: [UIImage] = []
            var totalDuration: TimeInterval = 0
            
            // Load all frames
            for i in 0..<frameCount {
                if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    let image = UIImage(cgImage: cgImage)
                    images.append(image)
                    
                    // Get frame duration
                    if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                       let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
                       let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                        totalDuration += delayTime
                    }
                }
            }
            
            // Set animation
            imageView.animationImages = images
            imageView.animationDuration = totalDuration
            imageView.startAnimating()
        }
        
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
} 