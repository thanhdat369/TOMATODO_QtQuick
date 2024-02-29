#include "taskcarditemlist.h"
#include <QDebug>
#include <QFile>
#include <QGuiApplication>

bool createDatabase(const QGuiApplication &app) {
	//	Database is a normal file. Check if file *.db is existed or not.
	QFile databaseFile(app.applicationDirPath() + "/tomatodoDB.db");

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(app.applicationDirPath() + "/tomatodoDB.db");

	if (!db.open()) {
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
		return false;
	}

	return true; // Database already exists
}

TaskCardItemList::TaskCardItemList(QObject *parent)
    : QSqlQueryModel(parent)
{
	this->updateModel();
}

QVariant TaskCardItemList::data(const QModelIndex &index, int role) const
{
	int columnId = role - Qt::UserRole - 1;
//	// Create the index using a column ID
	QModelIndex modelIndex = this->index(index.row(), columnId);

	return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> TaskCardItemList::roleNames() const
{
	QHash<int, QByteArray> roles;
	    roles[IdRole] = "id";
		roles[NameRole] = "name";
		roles[StartedDateRole] = "startedDate";
		roles[OriginalTimeRole] = "originalTime";
		roles[RemainTimeRole] = "timeRemain";
		roles[DoneRole] = "isDone";
		return roles;
}

void TaskCardItemList::updateModel()
{
	this->setQuery("select * from tomatodo");
}

bool TaskCardItemList::deleteItem(int id)
{
	QSqlQuery query;
	query.prepare("delete from tomatodo where id = ?");
	query.addBindValue(id);
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->updateModel();
		return true;
	}
	return false;
}

bool TaskCardItemList::addNewTask(QString name, int originTime)
{
	QSqlQuery query;
	query.prepare("insert into tomatodo (name,originalTime,remainTime) values (?,?,?)");
	query.addBindValue(name);
	query.addBindValue(originTime);
	query.addBindValue(originTime); // init remainTime = original
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->updateModel();
		return true;
	}
	return false;
}

bool TaskCardItemList::updateTimeRemain(int id,int timeRemain) {
	QSqlQuery query;
    query.prepare("update tomatodo set remainTime = ? where id = ?");
	query.addBindValue(timeRemain);
	query.addBindValue(id);
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->updateModel();
		return true;
	}
	return false;
}

bool TaskCardItemList::updateTask(int id, QString name, int timeOriginal) {
    QSqlQuery query;
    query.prepare("update tomatodo set name = ?, originalTime = ? where id = ?");
    query.addBindValue(name);
    query.addBindValue(timeOriginal);
    query.addBindValue(id);
    bool isSuccess = query.exec();

    if(isSuccess) {
        this->updateModel();
        return true;
    }
    return false;
}

bool TaskCardItemList::tickDoneTask(int id,bool isDone) {
	QSqlQuery query;
	query.prepare("update tomatodo set isDone = ? where id = ?");
	query.addBindValue(isDone ? 1 : 0); // convert to int
	query.addBindValue(id);
	bool isSuccess = query.exec();
	if(isSuccess) {
		this->updateModel();
		return true;
	}
	return false;
}
