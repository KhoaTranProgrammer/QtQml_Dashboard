import QtQuick 2.0

Item {
    id: id_root

    property int value: 0

    Rectangle {
        id: id_gear

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: "black"
        border.color: "light green"
        border.width: id_gear.height * 0.02

        Repeater {
            model: 7

            Item {
                height: id_gear.height/2
                transformOrigin: Item.Bottom
                rotation: index * 30 + 200
                x: id_gear.width/2

                Rectangle {
                    height: id_gear.height * 0.12 + index * id_gear.height * 0.01
                    width: height
                    color: index == value ? "light green" : "grey"
                    radius: width/2
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: id_gear.height * 0.05

                    Text {
                        anchors.centerIn: parent
                        color: "black"
                        text: index
                        font.pixelSize: parent.height * 0.5
                        font.family: "Comic Sans MS"
                    }
                }
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Gear\nPosition"
        color: "light green"
        font.pixelSize: id_gear.height * 0.1
        font.family: "Comic Sans MS"
    }
}
