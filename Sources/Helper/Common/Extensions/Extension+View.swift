//
//  File.swift
//  
//
//  Created by Danilo Hernandez.
//

import SwiftUI

extension View {
    
    func imageCardView() -> some View {
       modifier(ImageCardViewModifer()) 
    }
    func addSearchbar(remoteConfig: Binding<RemoteConfigModelMainView>,textSearch: Binding<String>,activeSearchBar: Bool, completion: @escaping () -> () ) -> some View {
        self.modifier(SearchBarModifier(remoteConfig: remoteConfig,textSearch: textSearch, activeSearchBar: activeSearchBar, completion: completion))
    }
    func showNavigationLink(link: String, show: Binding<Bool>, turn: Bool = false) -> some View {
        self.modifier(ShowLinkNavigationModifier(link: link, show: show, turn: turn))
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
