import QtQuick 2.0

Item {
    id: id_root

    property bool isActive: false

    onIsActiveChanged: {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        contextType: "2d"
        antialiasing: true

        onPaint: {
            var context = canvas.getContext('2d');

            if(isActive) context.fillStyle = "light green"
            else context.fillStyle = "grey"

            context.beginPath()
            context.moveTo(0, id_root.height / 2)
            context.lineTo(id_root.width / 3, 0)
            context.lineTo(id_root.width / 3, id_root.height)
            context.lineTo(0, id_root.height / 2)
            context.closePath()

            context.fill()
        }
    }

    Rectangle {
        id: id_rec

        anchors {
            left: id_root.left
            leftMargin: id_root.width / 3.1
            verticalCenter: id_root.verticalCenter
            right: id_root.right
        }
        height: id_root.height * 0.5
        color: isActive ? "light green" : "grey"
    }
}
