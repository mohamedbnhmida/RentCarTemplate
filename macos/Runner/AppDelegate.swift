import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
   override func applicationDidFinishLaunching(_ notification: Notification) {
 if let window = NSApplication.shared.windows.first{
    window.setContentSize(NSSize(width: 1360, height: 1080)) // Default size
    window.minSize = NSSize(width: 400, height: 720) 
   }}
}
