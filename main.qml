import QtQuick 2.4
import QtQuick.Controls 1.3


ApplicationWindow {
    id: app
    title: qsTr("Corkdev questions")
    width: 640
    height: 480
    visible: true

    color: "#f7f3ea"


    Connections {
        target: api
        onQuestionsChanged: {
            questionsModel.replaceQuestions(questions)
        }
    }

    Component.onCompleted: {
        api.fetchQuestions()
    }

    ListModel {
        id: questionsModel

        function replaceQuestions(questions) {
            questionsModel.clear()
            for(var i = 0; i < questions.length; i++) {
                var listElement = {
                    votes: questions[i].votes,
                    question: questions[i].question,
                    question_id: questions[i].id
                }
                questionsModel.append(listElement)
            }
        }
    }

    ListView {
        model: questionsModel
        anchors.fill: parent
        spacing: 3
        clip: true

        header: Header {}

        delegate: Question {
            question_id: model.question_id
            votes: model.votes
            question: model.question
        }
    }
}

