import QtQuick

Rectangle {
    id: root
    width: 800
    height: 600
    color: "#F4F7F6" // Light, clean background from the image
    signal keyClicked(string keyName)

    // ----------------------------------------------------
    // 1. THE ISOMETRIC WORLD CAMERA
    // ----------------------------------------------------
    // We create a central anchor point and rotate it in 3D space 
    // to fake an isometric perspective.
    Item {
        id: world
        anchors.centerIn: parent
        
        // The magic numbers for Isometric Projection
        transform: [
            Rotation { origin.x: 0; origin.y: 0; axis { x: 1; y: 0; z: 0 } angle: 10 },
            // Rotation { origin.x: 0; origin.y: 0; axis { x: 0; y: 1; z: 0 } angle: 60 },
            Rotation { origin.x: 0; origin.y: 0; axis { x: 0; y: 0; z: 1 } angle: -30 }
        ]

        // ----------------------------------------------------
        // 2. THE KEYBOARD GRID (Data Model)
        // ----------------------------------------------------
        ListModel {
            id: keyModel
            ListElement { name: "M"; gridX:480; gridY: -240; kColor: "#F46C6C" }// Red

            ListElement { name: "A"; gridX: 360; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: 360; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:360; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: 360; gridY: -360; kColor: "#F46C6C" } // Red
            
            ListElement { name: "A"; gridX: 0; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: 0; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: 0; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:0; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: 0; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: 0; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: 480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 0; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "B"; gridX: 120; gridY: 0; kColor: "#F46C6C" }   // Red
            ListElement { name: "X"; gridX: 120; gridY: -120; kColor: "#F46C6C" } // Red
            ListElement { name: "C"; gridX: 120; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX: 120; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: 120; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: 120; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 120; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 120; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 120; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 120; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 120; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "Del"; gridX: -120; gridY: 0; kColor: "#F46C6C" } // Red
            ListElement { name: "Ctrl"; gridX: -120; gridY: 120; kColor: "#F46C6C" }// Red
            ListElement { name: "M"; gridX: -120; gridY: -120; kColor: "#F46C6C" }// Red
            ListElement { name: "M"; gridX: -120; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -120; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -120; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -120; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -120; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -120; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -120; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -120; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -240; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -240; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -240; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-240; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -240; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -240; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -240; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -240; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -240; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -240; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -240; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: 240; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: 240; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: 240; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:240; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: 240; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "albert"; gridX: 240; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 240; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 240; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 240; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 240; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: 240; gridY: -840; kColor: "#F46C6C" } // Red
            
            ListElement { name: "A"; gridX: -360; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -360; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -360; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-360; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -360; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -360; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -360; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -360; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -360; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -360; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -360; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -480; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -480; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -480; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-480; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -480; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -480; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -480; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -480; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -480; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -480; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -480; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -600; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -600; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -600; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-600; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -600; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -600; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: -840; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -600; gridY: -960; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -720; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -720; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -720; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-720; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -720; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -720; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -720; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -720; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -720; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -720; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -720; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -840; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -840; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -840; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-840; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -840; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -840; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -840; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -840; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -840; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -840; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -840; gridY: -840; kColor: "#F46C6C" } // Red

            ListElement { name: "A"; gridX: -960; gridY: 0; kColor: "#3AB7A8" }     // Cyan
            ListElement { name: "Z"; gridX: -960; gridY: -120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "Alt"; gridX: -960; gridY: 120; kColor: "#3AB7A8" } // Cyan
            ListElement { name: "M"; gridX:-960; gridY: -240; kColor: "#F46C6C" }// Red
            ListElement { name: "Ctrl"; gridX: -960; gridY: 240; kColor: "#F46C6C" }// Red
            ListElement { name: "Del"; gridX: -960; gridY: -360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -960; gridY: 360; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -960; gridY: -480; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -960; gridY: -600; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -960; gridY: -720; kColor: "#F46C6C" } // Red
            ListElement { name: "Del"; gridX: -960; gridY: -840; kColor: "#F46C6C" } // Red
        }

        // ----------------------------------------------------
        // 3. GENERATING THE KEYS
        // ----------------------------------------------------
        Repeater {
            model: keyModel
            // Item {
            //     x: gridX
            //     y: gridY
            //     width: 100
            //     height: 100

            //     // The 3D Base (Shadow/Depth)
            //     Rectangle {
            //         anchors.fill: parent
            //         anchors.margins: 5
            //         radius: 15
            //         color: Qt.darker(kColor, 1.5) // Darken base for 3D effect
                    
            //         // The Top Face
            //         Rectangle {
            //             id: keyFace
            //             // width: keyMouse.pressed? parent.width-8: parent.width-13
            //             // height: keyMouse.pressed? parent.height-8: parent.height-13
            //             width: parent.width-3
            //             height: parent.height-3
            //             radius: 12
            //             color: kColor
                        
            //             // Fake physical travel when clicked
                        
                        // anchors.horizontalCenter: parent.horizontalCenter
                        // anchors.verticalCenter: parent.verticalCenter
                        // anchors.horizontalCenterOffset: keyMouse.pressed ? 0 : 14
                        // anchors.verticalCenterOffset: keyMouse.pressed ? 0 : -14

            //             // Dynamic RGB Glow on hover
            //             border.color: '#ffffff'
            //             border.width: 3
                        
            //             Behavior on anchors.horizontalCenterOffset { SpringAnimation { spring: 5; damping: 0.4 } }
            //             Behavior on anchors.verticalCenterOffset { SpringAnimation { spring: 5; damping: 0.4 } }
            //             Behavior on border.color { ColorAnimation { duration: 75 } }
            //             Behavior on width { NumberAnimation { duration: 75}}
            //             Behavior on height { NumberAnimation { duration: 75}}

            //             Text {
            //                 text: name
            //                 color: "#1E293B"
            //                 font.bold: true
            //                 font.pixelSize: 28
            //                 font.family: "Arial"
            //                 anchors.centerIn: parent
            //                 rotation: 0 // Counter-rotate text so it faces the screen!
            //             }
            //         }
            //     }

            //     // Interaction
            //     MouseArea {
            //         id: keyMouse
            //         anchors.fill: parent
            //         hoverEnabled: true
            //         onClicked: {
            //             // Tell the toon to jump to this specific key's coordinates
            //             toonBase.jumpTo(parent.x, parent.y)
            //             root.keyClicked(name)
            //         }
            //     }
            // }
            Item {
                x: gridX
                y: gridY
                width: 100
                height: 100

                
                // The total diagonal distance the key travels down and left
                // Unpressed = 12px of shadow wall. Pressed = 2px of shadow wall.
                property real currentTravel: keyMouse.pressed ? 2 : 12

                // ----------------------------------------------------
                // 1. THE SOLID EXTRUSION (The Walls)
                // ----------------------------------------------------
                Repeater {
                    model: 15 // 15 layers is enough to make the wall look completely solid

                    Rectangle {
                        width: parent.width
                        height: parent.width
                        radius: 16
                        color: "#181818" // The very dark shadow wall color

                        // Mathematically stack them between the base and the top face
                        // index 0 is the bottom-left, index 14 is the top-right
                        x: (index / 15) * parent.currentTravel
                        y: keyMouse.pressed? 12: 12 - ((index / 15) * 12)

                        // Smooth out the physical compression
                        Behavior on x { NumberAnimation { duration: 35}}
                        Behavior on y { NumberAnimation { duration: 35}}
                    }
                }

                // ----------------------------------------------------
                // 2. THE TOP FACE
                // ----------------------------------------------------
                Rectangle {
                    id: keyface
                    width: parent.width-2
                    height: parent.height-2
                    radius: 16
                    color: "#282828" // Slightly lighter matte black for the top
                    
                    // The subtle gray outline from the image
                    border.color: "#555555" 
                    border.width: 2

                    // Placed at the exact top-right of the extrusion stack
                    x: parent.currentTravel
                    y: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenterOffset: keyMouse.pressed ? 2 : 14
                    anchors.verticalCenterOffset: keyMouse.pressed ? 12 : 0

                    Behavior on x { SpringAnimation { spring: 5; damping: 0.4 } }
                    Behavior on y { SpringAnimation { spring: 5; damping: 0.4 } }

                    Text {
                        text: name
                        color: "#FFFFFF"
                        font.pixelSize: 42
                        font.bold: true
                        font.family: "Segoe UI", "Arial"
                        anchors.centerIn: parent
                    }
                }
                
                
                MouseArea {
                    id: keyMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        // Tell the toon to jump to this specific key's coordinates
                        toonBase.jumpTo(parent.x, parent.y)
                        root.keyClicked(name)
                    }
                }
            }
        }

        // ----------------------------------------------------
        // 4. THE JUMPING TOON
        // ----------------------------------------------------
        Item {
            id: toonBase
            x: 0 // Starts on "A"
            y: 0
            width: 100
            height: 100
            
            // Animate the base moving across the grid (X/Y plane)
            Behavior on x { NumberAnimation { duration: 500; easing.type: Easing.InOutQuad } }
            Behavior on y { NumberAnimation { duration: 500; easing.type: Easing.InOutQuad } }

            // The Visual Body of the Toon
            Item {
                id: toonBody
                anchors.centerIn: parent
                width: 40
                height: 80
                
                // Counter-rotate the toon so it stands up straight, facing the camera
                transform: [
                    Rotation { origin.x: 20; origin.y: 80; axis { x: 0; y: 0; z: 1 } angle: 30 }
                    // Rotation { origin.x: 20; origin.y: 80; axis { x: 1; y: 0; z: 0 } angle: -60 }
                ]

                // Toon visual elements
                Rectangle {
                    width: 40; height: 60; radius: 20
                    color: "#F6C879" // Key character color
                    border.color: Qt.rgba(0.2, 0.2, 0.2); border.width: 2
                    
                    // Sunglasses
                    Rectangle { x: 5; y: 15; width: 30; height: 10; color: "#111"; radius: 3 }
                    // Cape
                    Rectangle { x: -10; y: 20; width: 20; height: 40; color: "#F46C6C"; rotation: 15; z: -1 }
                }

                // The Parabola Arc Animation (The Jump)
                SequentialAnimation {
                    id: jumpArc
                    // Launch up! (Negative Y offset)
                    NumberAnimation { target: toonBody; property: "anchors.verticalCenterOffset"; to: -150; duration: 250; easing.type: Easing.OutQuad }
                    // Fall down! (Back to 0 offset)
                    NumberAnimation { target: toonBody; property: "anchors.verticalCenterOffset"; to: 0; duration: 250; easing.type: Easing.InQuad }
                }
            }

            // JavaScript function triggered by the keys
            function jumpTo(targetX, targetY) {
                // Change base coordinates (triggers the Behavior on x/y)
                toonBase.x = targetX
                toonBase.y = targetY
                // Trigger the vertical arc bounce
                jumpArc.restart()
            }
        }
    }
}