import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


Item {
    id: root

    width: parent.width
    height: content.height + 20

    property int question_id : -1   // We'll get that from the server
    property int votes: 0
    property string question: ""


    Item {

        id: innerContainer

        anchors.fill: parent
        anchors.margins: 10


        RowLayout {

            id: content

            anchors.margins: 20

            ColumnLayout {
                Layout.preferredWidth: 50
                Button {
                    Layout.alignment: Qt.AlignHCenter
                    style: SmallButtonStyle {}
                    text: "+"

                    onClicked: {
                        api.upvote(question_id)
                    }
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: votes
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "Lato"
                    color: "#403329"
                }
                Button {
                    Layout.alignment: Qt.AlignHCenter
                    style: SmallButtonStyle {}
                    text: "-"
                }
            }

            Text {
                Layout.preferredWidth: innerContainer.width - 50
                text: question
                font.family: "Lato"
                color: "#403329"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            }
        }

    }

}
