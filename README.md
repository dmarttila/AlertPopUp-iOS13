# AlertPopUp-iOS13

Package for creating alerts in iOS 13 - 15.2

Usage:
In Xcode: File -> Add Packages
Add this package by pasting https://github.com/dmarttila/AlertPopUp-iOS13 into the package search area

To add alerts to a view do the following:
1. import the pacakge into the file. Add "import AlertPopUp-iOS13" 
2. In the body of the view, add "@State private var alertParams: AlertParams?"
3. Add a modifier to the view. At the bottom of the view (where you might add .padding()) add the following: ".modifier(AlertModifier(alertParams: $alertParams))"
4. Add value to the alertParams state var. Something like: 
Button("Alert with one button and action") {
    alertParams = AlertInfo(title: "Title", message: "Description", showTwoButtons: false, primaryButtonLabel: "Single button func") 
    { 
        print("Single button func") 
    }
}
5. Preview and click the button. The alert should pop up. 

MIT License

