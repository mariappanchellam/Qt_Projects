import QtQuick 2.14
import QtQuick.Controls 2.14


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480

    signal customSignal(string message)

    Rectangle {
        width: 200
        height: 100
        color: "lightblue"

        MouseArea {
            anchors.fill: parent
            onClicked: mainWindow.customSignal("Hello from Rectangle 1!")
        }
    }

    Rectangle {
        x: 220 // Position the second rectangle next to the first one
        width: 200
        height: 100
        color: "lightgreen"

        MouseArea {
            anchors.fill: parent
            onClicked: mainWindow.customSignal("Hello from Rectangle 2!")
        }
    }

    function handleCustomSignal(message) {
        console.log("Received Signal in Main Window: " + message)
    }

    Connections {
        target: mainWindow
        onCustomSignal: handleCustomSignal(message)
    }
}
