#ifndef TASKCARDITEMLIST_H
#define TASKCARDITEMLIST_H

#include <QAbstractListModel>
#include <QSqlQueryModel>
#include <QSqlQuery>
class TaskCardItemList : public QSqlQueryModel
{
	Q_OBJECT

public:
	enum Roles {
		IdRole = Qt::UserRole + 1,      // id
		NameRole,
		StartedDateRole,
		OriginalTimeRole,
		RemainTimeRole,
		DoneRole
	};
	explicit TaskCardItemList(QObject *parent = nullptr);

	QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
	QHash<int, QByteArray> roleNames() const;

private:
public slots:
	void updateModel();
	bool deleteItem(int id);
	bool addNewTask(QString name, int originTime);
	bool updateTimeRemain(int id,int timeRemain);
	bool tickDoneTask(int id,bool isDone);
//	int getId();
};

#endif // TASKCARDITEMLIST_H
