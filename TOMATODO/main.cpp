#include "taskcarditemlist.h"
#include "TomatodoUtils.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QTranslator qTrans;
    qTrans.load("english.qm",app.applicationDirPath());
    app.installTranslator(&qTrans);

    QQmlApplicationEngine engine;

	//TODO: Create a WARNING popup for this case
	utils::createDatabase(app); //This function returns BOOL value

	TaskCardItemList *taskCardItemList = new TaskCardItemList();

	engine.rootContext()->setContextProperty("myModel", taskCardItemList);

	const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
