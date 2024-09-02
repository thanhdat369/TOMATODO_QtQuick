#include "TomatodoUtils.h"
#include <QFile>
#include <QGuiApplication>

namespace LOGGING {

Q_LOGGING_CATEGORY(database, "tomatodo.database")

}
namespace {
QString dbName("tomatodoDB.db");
}

bool utils::createDatabase(const QGuiApplication &app) {
	// TODO use the join path function
	const QString dbPath(app.applicationDirPath()+"/" + dbName);
	QFile databaseFile(dbPath);

	if (databaseFile.exists()) {
		qCWarning(LOGGING::database) << "WARNNING Database existed: " << dbName;
	}

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(dbPath);

	if (!db.open()) {
		qCCritical(LOGGING::database) << "Error: Unable to open the database";
		return false;
	}

	// Create the necessary tables
	QSqlQuery query;
	query.prepare(
	    "CREATE TABLE IF NOT EXISTS tomatodo ("
	    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
	    "name TEXT, "
	    "startedDate TEXT NOT NULL DEFAULT (datetime('now', 'localtime')), "
	    "originalTime INTEGER NOT NULL DEFAULT 0, "
	    "remainTime INTEGER, "
	    "isDone INTEGER)"
	);

	if (!query.exec()) {
		qFatal("ERROR: CANNOT CREATE TABLE");
		return false;
	}

	qCInfo(LOGGING::database) << "INFO: Database and table created successfully";
	return true; // Database already exists
}
