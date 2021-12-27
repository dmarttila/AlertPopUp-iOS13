# AlertPopUp-iOS13

Package for creating alerts in iOS 13 - 15.2

Example usage:

[a sample view]

import AlertPopUp-iOS13

body....

@State private var alertParams: AlertParams?

VStack {

    Button("Alert with one button and action") {
    
        alertParams = AlertInfo(title: "Title", message: "Description", showTwoButtons: false, primaryButtonLabel: "Single button func") { print("Single button func") }
        
    }
}

.modifier(AlertModifier(alertParams: $alertParams))
