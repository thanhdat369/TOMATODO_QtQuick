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
		IdRole = Qt::UserRole + 1, // id
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
	void fetchDataFromDB();

	bool addNewTask(const QString &name, const int &originTime);
	bool updateTimeRemain(const int &id, const int &timeRemain);
	bool updateTask(const int &id, const QString &name, const int &timeOriginal);
	bool tickDoneTask(const int &id,const bool &isDone);

	bool deleteItem(const int &id);
};

#endif // TASKCARDITEMLIST_H
