#include "TomatodoUtils.h"
#include <QFile>
#include <QGuiApplication>

namespace L {

Q_LOGGING_CATEGORY(database, "tomatodo.database")

}

bool utils::createDatabase(const QGuiApplication &app) {
	//	Database is a normal file. Check if file *.db is existed or not.
	QFile databaseFile(app.applicationDirPath() + "/tomatodoDB.db");
	qCWarning(L::database) << "Database existed status : " << databaseFile.exists();

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(app.applicationDirPath() + "/tomatodoDB.db");

	if (!db.open()) {
		qCCritical(L::database) << "Error: Unable to open the database";
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
		qCCritical(L::database) << "Error: Unable to create table";
		return false;
	}

	qCInfo(L::database) << "Database and table created successfully";
	return true; // Database already exists
}
