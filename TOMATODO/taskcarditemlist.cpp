#include "taskcarditemlist.h"
#include <QDebug>

TaskCardItemList::TaskCardItemList(QObject *parent)
    : QSqlQueryModel(parent)
{
	this->fetchDataFromDB();
}

QVariant TaskCardItemList::data(const QModelIndex &index, int role) const
{
	int columnId = role - Qt::UserRole - 1;
	//Create the index using a column ID
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

void TaskCardItemList::fetchDataFromDB()
{
	// https://en.cppreference.com/w/cpp/language/string_literal
	const auto queryString = R"(select * from tomatodo)";
	this->setQuery(queryString);
}

bool TaskCardItemList::deleteItem(const int &id)
{
	QSqlQuery query;
	const auto queryString = R"(delete from tomatodo where id = ?)";
	query.prepare(queryString);
	query.addBindValue(id);

	if (query.exec()) {
		this->fetchDataFromDB();
		return true;
	}

	return false;
}

bool TaskCardItemList::addNewTask(const QString &name, const int &originTime)
{
	QSqlQuery query;
	const auto queryString = R"(insert into tomatodo (name,originalTime,remainTime) values (?,?,?))";
	query.prepare(queryString);
	query.addBindValue(name);
	query.addBindValue(originTime);
	query.addBindValue(originTime); // init remainTime = original
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->fetchDataFromDB();
		return true;
	}
	return false;
}

bool TaskCardItemList::updateTimeRemain(const int &id,const int &timeRemain) {
	QSqlQuery query;
	query.prepare(R"(update tomatodo set remainTime = ? where id = ?)");
	query.addBindValue(timeRemain);
	query.addBindValue(id);
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->fetchDataFromDB();
		return true;
	}
	return false;
}

bool TaskCardItemList::updateTask(const int &id,const QString &name, const int &timeOriginal) {
	QSqlQuery query;
	query.prepare(R"(update tomatodo set name = ?, originalTime = ? where id = ?)");
	query.addBindValue(name);
	query.addBindValue(timeOriginal);
	query.addBindValue(id);
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->fetchDataFromDB();
		return true;
	}
	return false;
}

bool TaskCardItemList::tickDoneTask(const int &id,const bool &isDone) {
	QSqlQuery query;
	query.prepare(R"(update tomatodo set isDone = ? where id = ?)");
	query.addBindValue(isDone ? 1 : 0); // convert to int
	query.addBindValue(id);
	bool isSuccess = query.exec();

	if(isSuccess) {
		this->fetchDataFromDB();
		return true;
	}
	return false;
}
