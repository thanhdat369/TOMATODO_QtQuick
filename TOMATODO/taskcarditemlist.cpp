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
		roles[FNameRole] = "name";
		return roles;
}

void TaskCardItemList::updateModel()
{
	this->setQuery("select * from tomatodo");
}
