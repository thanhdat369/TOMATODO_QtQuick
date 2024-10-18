#ifndef DATABASETOMATODOUTILS_H
#define DATABASETOMATODOUTILS_H

#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QLoggingCategory>
#include <QDir>
#include <QString>

class QFile;
class QString;
class QDir;

// TODO ADD DBUtils
namespace utils {

bool createDatabase();
bool checkDatabseExisted(const QString applicationPath);
const QString getDatabseName();
const QString getDatabseType();
const QString getDatabasePath(const QString applicationDirPath);
bool processAndCreateTheDatabase();

} // namespace ultils
#endif // DATABASETOMATODOUTILS_H
