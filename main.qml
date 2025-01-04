
import QtQuick

Window {
    id:window
    width: 400
    height: 600
    visible: true
    title: qsTr("Hello World")
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height

    // Immagine di sfondo (prima immagine)
    Image {
        id: background1
        source: "qrc:/image/back.jpg"
        height: parent.height - 80
        width: height * 1.33
        anchors.top: parent.top
        anchors.bottomMargin: 80
        x: 0  // Posizione iniziale a sinistra
    }

    // Immagine di sfondo (seconda immagine per il loop continuo)
    Image {
        id: background2
        source: "qrc:/image/back.jpg"
        height: parent.height - 80
        width: height * 1.33
        anchors.left: background1.right
        anchors.top: parent.top
        anchors.bottomMargin: 80
        x: background1.width  // Posiziona la seconda immagine subito dopo la prima
    }

    // Animazione per il movimento continuo delle immagini
    // Ora il movimento è a ciclo continuo, senza spazi bianchi
    SequentialAnimation {
        loops: Animation.Infinite
        running: true

        // Anima la prima immagine per farla spostare a sinistra
        NumberAnimation {
            target: background1
            property: "x"
            from: 0
            to: -background1.width
            duration: 5000
            easing.type: Easing.Linear
        }


    }

    // Immagine del suolo
    Image {
        id: ground
        source: "qrc:/image/base.jpg"
        anchors.top: background1.bottom
        height: 80
    }

    // Immagine del soldato
    Image {
        objectName: sold
        id: sold
        source: "qrc:/image/soldier.png"
        anchors.bottom: ground.top
        anchors.left: parent.left
        width: 90
        height: 90
        anchors.leftMargin: 20
        anchors.bottomMargin: -8
         SequentialAnimation {id:jumpping
    NumberAnimation{

                                  target: sold
                                  property: "y"
                                  from: 72
                                  to: 100
                                  duration: 2000
                                  easing.type: Easing.Linear

                          }}
        onYChanged{jumpping.running : true}


    }
    MouseArea{
        anchors.fill: windows
        id:tap
        onClicked: {
            soldier.jump();  // Chiama il metodo jump() definito nella tua classe C++
        }
    }
}
