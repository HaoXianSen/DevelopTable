//
//  ViewController.swift
//  DevelopTable
//
//  Created by 郝玉鸿 on 2023/2/24.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var podfilePath: NSTextField!
    
    @IBOutlet weak var initButton: NSButton!
    
    @IBOutlet weak var selecteFileButton: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func initAction(_ sender: Any) {
    }
    
    @IBAction func selectFileAction(_ sender: NSButton) {
        openFileSelectePanel()
    }
}

extension ViewController: NSOpenSavePanelDelegate {
    func openFileSelectePanel()  {
        let panel = NSOpenPanel()
        panel.message = "请选择Podfile文件"
        panel.allowedFileTypes = [""]
        panel.allowsMultipleSelection = false
        let path = URL(string: "\(NSHomeDirectory())/Desktop")
        panel.directoryURL = path
        panel.delegate = self
        panel.begin { modelResponse in
            if modelResponse == NSApplication.ModalResponse.OK {
                guard let path = panel.url, path.lastPathComponent == "Podfile" else {
                    let alert = NSAlert()
                    alert.messageText = "请选择Podfile文件！"
                    alert.icon = NSImage(named: "error_icon")
                    alert.alertStyle = .warning
                    alert.runModal()
                    return
                }
                self.podfilePath.placeholderString = path.absoluteString
            }
        }
    }
    
//    func panel(_ sender: Any, shouldEnable url: URL) -> Bool {
//        return url. && url.lastPathComponent == "Podfile"
//    }
}

