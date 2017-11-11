#ifndef APIWRAPPER_H
#define APIWRAPPER_H

#include <algorithm>
#include <QObject>
#include <QAbstractListModel>
#include "SWGPublicApi.h"
#include "SWGQuestion.h"


using Swagger::SWGQuestion;

class ApiWrapper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList questions MEMBER questions_ NOTIFY questionsChanged)

public:
    explicit ApiWrapper(QObject *parent = 0);
    void setApi(Swagger::SWGPublicApi * api);

signals:
    void questionsChanged(QVariantList questions);

public slots:
    void fetchQuestions();
    void addQuestion(QString question);
    void upvote(qint64 questionId);

protected slots:
    void onQuestionsChanged(QList<SWGQuestion*>* questions);
    void onQuestionAdded(SWGQuestion* question);
    void onUpvoteDone(qint64 notSureWhatItIs);

private:
    Swagger::SWGPublicApi * api_;
    QVariantList questions_;
};

#endif // APIWRAPPER_H
