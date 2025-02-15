import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 400
    height: 600
    visible: true
    title: qsTr("Soldier Jump Simulation")

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
    SequentialAnimation {
        loops: Animation.Infinite
        running: true

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
        id: sold
        source: "qrc:/image/soldier.png"
        width: 90
        height: 90
        //anchors.bottom: ground.top
        anchors.left: parent.left
        anchors.leftMargin: 20

        y: window.height-162

        // Animazione del salto
        SequentialAnimation {
            id: jumpAnimation
            running: false

            // Salto su (aumento di Y)
            NumberAnimation {
                target: sold
                property: "y"
                from: sold.y
                to: sold.y-80
                duration: 500  // Durata del salto
                easing.type: Easing.Linear
            }

            // Salto giù (decremento di Y)
            NumberAnimation {
                target: sold
                property: "y"
                from: sold.y-80
                to: sold.y
                duration: 500  // Durata della discesa
                easing.type: Easing.Linear
            }
        }
    }

    // MouseArea per attivare il salto
    MouseArea {
        anchors.fill: parent
        id: tap
        onClicked: {
            console.log("Cliccato! Avvio salto.");
            // Avvia l'animazione del salto quando viene cliccato
            jumpAnimation.start();

        }
    }
}
