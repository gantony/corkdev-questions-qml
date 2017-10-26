import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    height: childrenRect.height

    ColumnLayout {

        RowLayout {
            id: firstRow
            Image {
                id: logo
                source: "qrc:/logo.png"
            }
            Text {
                Layout.preferredWidth: app.width - logo.width

                text: "Questions for today's talk"
                font.family: "Lato"
                font.pixelSize: 48
                color: "#cc000d"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
        }

        RowLayout {
            TextField {
                id: newQuestion
                Layout.preferredWidth: app.width - askButton.width
                anchors.leftMargin: 30
                placeholderText: qsTr("When are we eating pizza???")
            }

            Button {
                id: askButton
                text: "Ask question!"

                onClicked: {
                    api.addQuestion(newQuestion.text)
                }
            }
        }
    }
}
