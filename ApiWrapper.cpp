#include "ApiWrapper.h"

ApiWrapper::ApiWrapper(QObject *parent) : QObject(parent)
{

}

void ApiWrapper::setApi(Swagger::SWGPublicApi * api)
{
    api_ = api;

    connect(api_, SIGNAL(listQuestionsSignal(QList<SWGQuestion*>*)), this, SLOT(onQuestionsChanged(QList<SWGQuestion*>*)));
    connect(api_, SIGNAL(addQuestionSignal(SWGQuestion*)), this, SLOT(onQuestionAdded(SWGQuestion*)));
    connect(api_, SIGNAL(upvoteSignal(qint64)), this, SLOT(onUpvoteDone(qint64)));
}

void ApiWrapper::fetchQuestions()
{
    api_->listQuestions();
}

void ApiWrapper::addQuestion(QString question)
{
    qDebug() << "addQuestion()" << question;

    Swagger::SWGQuestion *q = new Swagger::SWGQuestion();
    q->setQuestion(new QString(question));
    api_->addQuestion(*q);
}

void ApiWrapper::upvote(qint64 questionId)
{
    api_->upvote(questionId);
}

void ApiWrapper::onQuestionsChanged(QList<SWGQuestion*>* questions)
{
    qDebug() << "Recieved some questions" << questions->length();

    questions_.clear();
    foreach(SWGQuestion *question, *questions) {
        QVariantMap q;
        q["id"] = question->getId();
        q["question"] = *question->getQuestion();
        q["votes"] = question->getVotes();

        questions_ << q;
    }

    // Sort by decreasing number of votes
    std::sort(questions_.begin(), questions_.end(), [](QVariant a, QVariant b) {
        return a.toMap()["votes"] > b.toMap()["votes"];
    });

    emit questionsChanged(questions_);
}

void ApiWrapper::onQuestionAdded(SWGQuestion* question)
{
    QVariantMap q;
    q["id"] = question->getId();
    q["question"] = *question->getQuestion();
    q["votes"] = question->getVotes();

    questions_ << q;

    emit questionsChanged(questions_);

    qDebug() << "Question added, not have:" << questions_;
}

void ApiWrapper::onUpvoteDone(qint64 notSureWhatItIs)
{
    qDebug() << "upvoted question, result:" << notSureWhatItIs;
    // Let's refresh everything, just because we can
    fetchQuestions();
}
