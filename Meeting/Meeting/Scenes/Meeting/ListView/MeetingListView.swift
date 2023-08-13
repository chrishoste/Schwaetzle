import SwiftUI

/// A view that displays a list of meeting rooms along with their associated information.
struct MeetingListView: View {
    
    @Bindable var viewModel: MeetingListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 12) {
                    ForEach(viewModel.filteredRooms, id: \.id) { room in
                        listCell(room: room)
                    }
                }
            }
            .navigationTitle("Rooms")
            .combinedNavigation()
            .toolbar {
                FilterToolBarButton(showFilter: $viewModel.showFilter, isFiltered: viewModel.isFiltered)
            }
            .sheet(isPresented: $viewModel.showFilter) {
                FilterSheet(filter: viewModel.filter)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationContentInteraction(.scrolls)
            }
        }
    }
}

/// A private extension on MeetingListView providing methods for building cells for rooms or facts.
private extension MeetingListView {
    /// Creates a view cell for a room or fact based on the presence of a fact.
    /// - Parameter room: The room to display.
    @ViewBuilder
    func listCell(room: Room) -> some View {
        if let fact = room.fact {
            ConditionalNavigationLink(value: fact) {
                FactCell(room: room, fact: fact)
            }
        } else {
            ConditionalNavigationLink(value: room, conditon: room.isMeetingRoom) {
                MeetingCell(room: room)
            }
        }
    }
}

/// A custom modifier to handle combined navigation to Fact and Meeting detail views.
private struct CombinedNavigationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Fact.self) { fact in
                FactDetailsView(fact: fact)
            }
            .navigationDestination(for: Room.self) { room in
                MeetingDetailView(roomID: room.id, roomName: room.name)
            }
    }
}

private extension View {
    /// Apply combined navigation to the view.
    func combinedNavigation() -> some View {
        self.modifier(CombinedNavigationViewModifier())
    }
}
