//
//  VideoListView.swift
//  Africa
//
//  Created by Andrew Acton on 7/18/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }//: Loop
            }//: List
            .listStyle(InsetListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//: Navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
