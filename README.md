# AlertPopUp-iOS13

Helper for creating alerts in iOS 13 - 15.2

Usage:

@State private var alertParams: AlertParams?
VStack {
    Button("Alert with one button and action") {
        alertParams = AlertInfo(title: "Title", message: "Description", showTwoButtons: false, primaryButtonLabel: "Single button func") { print("Single button func") }
    }
}
.modifier(AlertModifier(alertParams: $alertParams))
