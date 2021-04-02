//
//  AboutScreen.swift
//  CombineMarbles
//
//  Created by Robert Palmer on 29.03.21.
//  Copyright © 2021 Robert Palmer. All rights reserved.
//
import AVKit
import SwiftUI

struct AboutScreen: View {
        
    var doneAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("done", action: doneAction)
                    .font(.navigationBarItem)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 0)
            }
        
            Text(
                "Combine Mables is an app for experimenting with combine's publisher operations."
            )
            .font(Font.custom("Avenir-Black", size: 20))
            .foregroundColor(.foreground)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.bottom, 20)
            
            if let url = Bundle.main.url(forResource: "about", withExtension: "mov") {
                VideoPlayer(url: url)
                    .frame(height: 300)
            }

            Text(
                "Each marble represents an event omitted by a published. Move them around to see how an operator works."
            )
            .font(Font.custom("Avenir-Black", size: 20))
            .foregroundColor(.foreground)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            .padding(.bottom, 12)

            Spacer()
            
            VStack(alignment: .leading) {
                Text("Source code available at")
                Link("https://github.com/robertpalmer/CombineMarbles", destination: URL(string: "https://github.com/robertpalmer/CombineMarbles")!)
            }
            .padding(.bottom, 48)
        }
        .font(Font.custom("Avenir", size: 16))
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("neutral600"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen {}
    }
}

struct VideoPlayer: UIViewControllerRepresentable {
    
    class Coordinator {
        var looper: AVPlayerLooper?
    }
    let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let queuePlayer = AVQueuePlayer(items: [])
        context.coordinator.looper = AVPlayerLooper(player: queuePlayer, templateItem: AVPlayerItem(url: url))
        
        let viewController = AVPlayerViewController()
        viewController.showsPlaybackControls = false
        viewController.player = queuePlayer
        viewController.player?.play()
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

