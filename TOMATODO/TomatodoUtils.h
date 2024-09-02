#ifndef TOMATODOUTILS_H
#define TOMATODOUTILS_H

#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QLoggingCategory>

class QFile;
class QGuiApplication;

namespace utils {
	bool createDatabase(const QGuiApplication &app);
}
#endif // TOMATODOUTILS_H
