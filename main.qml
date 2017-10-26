import QtQuick 2.4
import QtQuick.Controls 1.3


ApplicationWindow {
    id: app
    title: qsTr("Corkdev questions")
    width: 640
    height: 480
    visible: true

    color: "#f7f3ea"


    ListModel {
        id: questionsModel

        ListElement {
            votes: 20
            question: "what is this talk about??"
        }
        ListElement {
            votes: 5
            question: "What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? "
        }
        ListElement {
            votes: 20
            question: "what is this talk about??"
        }
        ListElement {
            votes: 5
            question: "What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? "
        }
        ListElement {
            votes: 20
            question: "what is this talk about??"
        }
        ListElement {
            votes: 5
            question: "What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? What is this talk about?? "
        }
    }

    ListView {
        model: questionsModel
        anchors.fill: parent
        spacing: 3
        clip: true

        header: Header {}

        delegate: Question {
            votes: model.votes
            question: model.question
        }
    }
}

