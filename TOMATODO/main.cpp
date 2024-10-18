#include "taskcarditemlist.h"
#include "DatabaseTomatodoUtils.h"
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

	// TODO Add language
    // QTranslator qTrans;
    // qTrans.load("vietnamese.qm",app.applicationDirPath());
    // app.installTranslator(&qTrans);

	QQmlApplicationEngine engine;

	//TODO: Create a WARNING popup for this case
	QSqlDatabase db = QSqlDatabase::addDatabase(utils::getDatabseType());
	db.setDatabaseName(utils::getDatabseName());
	if (!db.open())
	{
		return EXIT_FAILURE;
	}

	bool loadDatabaseSucces = utils::processAndCreateTheDatabase();
	if (!loadDatabaseSucces) {
		return EXIT_FAILURE;
	}

	// Init the model here
	TaskCardItemList *taskCardItemList = new TaskCardItemList();
	engine.rootContext()->setContextProperty("dataModel", taskCardItemList);

	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
	                 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

	return app.exec();
}
