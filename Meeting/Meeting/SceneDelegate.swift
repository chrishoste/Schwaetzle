import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    /// The window associated with the scene.
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let environment = DefaultEnvironment()
        
        /// The `AppContext` instance that provides the entry view controller for the app.
        let appContext: AppContext = DefaultAppContext(environment: environment)
        
        // Create a new UIWindow and assign it to the window property.
        window = UIWindow(windowScene: windowScene)

        // Set the app's entry view controller as the root view controller for the window.
        window?.rootViewController = appContext.entryViewController()
        
        // Make the window visible.
        window?.makeKeyAndVisible()
    }
}
