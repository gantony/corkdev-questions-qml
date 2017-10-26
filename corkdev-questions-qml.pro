TEMPLATE = app

QT += core qml quick widgets

INCLUDEPATH += $$PWD/client

SOURCES += \
    main.cpp \
    $$PWD/client/SWGHelpers.cpp \
    $$PWD/client/SWGHttpRequest.cpp \
    $$PWD/client/SWGPublicApi.cpp \
    $$PWD/client/SWGQuestion.cpp

HEADERS += \
    $$PWD/client/SWGHelpers.h \
    $$PWD/client/SWGHttpRequest.h \
    $$PWD/client/SWGPublicApi.h \
    $$PWD/client/SWGQuestion.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
