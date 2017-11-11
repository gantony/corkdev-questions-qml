TEMPLATE = app

QT += core qml quick widgets

CONFIG += c++11

INCLUDEPATH += $$PWD/client

SOURCES += \
    main.cpp \
    $$PWD/client/SWGHelpers.cpp \
    $$PWD/client/SWGHttpRequest.cpp \
    $$PWD/client/SWGPublicApi.cpp \
    $$PWD/client/SWGQuestion.cpp \
    $$PWD/ApiWrapper.cpp

HEADERS += \
    $$PWD/client/SWGHelpers.h \
    $$PWD/client/SWGHttpRequest.h \
    $$PWD/client/SWGPublicApi.h \
    $$PWD/client/SWGQuestion.h \
    $$PWD/ApiWrapper.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
