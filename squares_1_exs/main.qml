import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window {
    id: main
    width: 640
    height: 480
    visible: true

    Rectangle{
        id: scene
        anchors.fill: parent

        function getRand(){
            var minStep = 20
            var maxStep = 80
            return Math.floor(Math.random() * (maxStep  - minStep + 1)) + minStep;
        }

        Rectangle{
            id: leftRect
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text{
                id: moveText
                anchors.centerIn: parent
                text: "move"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(circle.x + circle.width >= rightRect.x){
                        scene.state = "InitialState"
                    }
                    else{
                        circle.x += scene.getRand();
                        if(circle.x + circle.width > rightRect.x + rightRect.width)
                            circle.x = rightRect.x + rightRect.width - circle.width;

                        scene.state = "OtherState";
                    }
                }
            }
        }

        Rectangle{
            id: rightRect
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text{
                id: returnText
                anchors.centerIn: parent
                text: "return"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }

        Rectangle{
            id: circle
            color: "green"
            x: leftRect.x + 5
            y: leftRect.y + 5
            width: leftRect.width - 10
            height: leftRect.height - 10
            radius: width / 2
        }

        states:  [
            State{
                name: "OtherState"
                PropertyChanges{
                    target: circle
                }
            },

            State {
                name: "InitialState"
                PropertyChanges {
                    target: circle
                    x: leftRect.x + 5
                    y: leftRect.y + 5
                }
            }
        ]

        transitions: [
            Transition {
                from: "OtherState"
                to: "InitialState"

                NumberAnimation {
                    properties:  "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
