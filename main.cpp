#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Soldier.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Registrazione della classe Soldier in QML
    qmlRegisterType<Soldier>("Game", 1, 0, "Soldier");

    QQmlApplicationEngine engine;

    // Carica il file QML (assicurati che il percorso del file .qml sia corretto)
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
