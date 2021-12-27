# AlertPopUp-iOS13

Package for creating alerts in iOS 13 - 14

Usage:

Import the package into your project:
1. In Xcode: File -> Add Packages
2. Add this package by pasting https://github.com/dmarttila/AlertPopUp-iOS13 into the package search area
3. Choose "Up to Next Major Version" for "Dependency Rule"
4. Press the "Add Package" button (Xcode will verify the package)
5. Once verified, you get another "Add Package" button. Click it.

To add alerts to a view, do the following:
1. Import the pacakge into the view file. Add "import AlertPopUp-iOS13" under "import SwiftUI". If the package has been imported, you should get code-completion on the import.
2. Above the body of the view, add "@State private var alertParams: AlertParams?"
3. At the bottom of the view (where you might add .padding()) where you want to add the alert, add the following: ".modifier(AlertModifier(alertParams: $alertParams))"
4. To trigger the alert, you need to add a value to the alertParams @State var. Something like: 
Button("Alert with one button and action") {
    alertParams = AlertParams(title: "Title", message: "Description", showTwoButtons: false, primaryButtonLabel: "Single button func") 
    { 
        print("Single button func") 
    }
}
5. Preview and click the button. The alert should pop up. 

Repo of usage examples here: https://github.com/dmarttila/AlertPopupsUsingPackage

MIT License

