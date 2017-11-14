#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "SWGPublicApi.h"
#include "ApiWrapper.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Swagger::SWGPublicApi * publicApi = new Swagger::SWGPublicApi("virtserver.swaggerhub.com", "/gantony/CorkDevQuestions/1.0.0");
    Swagger::SWGPublicApi * publicApi = new Swagger::SWGPublicApi("http://178.62.124.192:4567", "/gantony/CorkDevQuestions/1.0.0");
    ApiWrapper * api = new ApiWrapper();
    api->setApi(publicApi);

    engine.rootContext()->setContextProperty("api", api);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
