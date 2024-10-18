#include "DatabaseTomatodoUtils.h"
#include <QFile>

namespace LOGGING {

Q_LOGGING_CATEGORY(database, "tomatodo.database")

}
namespace {
const QString dbType("QSQLITE");
const QString dbName("tomatodoDB.db");
}

namespace utils{

const QString getDatabseName()
{
	return QString(dbName);
}

const QString getDatabseType()
{
	return QString(dbType);
}

const QString getDatabasePath(const QString applicationDirPath)
{
	// join applicationPath + " / " + fileName
	return QDir(applicationDirPath).filePath(dbName);
}

bool checkDatabseExisted(const QString applicationPath)
{
	const QFile dbFile(getDatabasePath(applicationPath));
	return dbFile.exists();
}

bool createTable() {
	QSqlQuery query;
	query.prepare(
	    "CREATE TABLE IF NOT EXISTS tomatodo ("
	    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
	    "name TEXT, "
	    "startedDate TEXT NOT NULL DEFAULT (datetime('now', 'localtime')), "
	    "originalTime INTEGER NOT NULL DEFAULT 0, "
	    "timeRemain INTEGER, "
	    "isDone INTEGER)"
	);

	if (!query.exec()) {
		qFatal("ERROR: CANNOT CREATE TABLE");
		return false;
	}

	qCInfo(LOGGING::database) << "INFO: Database created successfully";
	return true;
}

bool processAndCreateTheDatabase() {
	return createTable();
}

} // namespace utils
