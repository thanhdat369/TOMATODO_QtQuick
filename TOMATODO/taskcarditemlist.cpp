#include "taskcarditemlist.h"

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
