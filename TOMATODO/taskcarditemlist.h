#ifndef TASKCARDITEMLIST_H
#define TASKCARDITEMLIST_H

#include <QAbstractListModel>
#include <QSqlQueryModel>
class TaskCardItemList : public QSqlQueryModel
{
	Q_OBJECT

public:
	enum Roles {
		IdRole = Qt::UserRole + 1,      // id
		FNameRole,                      // Firt name
		SNameRole,                      // Last name
		NikRole                         // Nik name
	};
	explicit TaskCardItemList(QObject *parent = nullptr);

	QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
	QHash<int, QByteArray> roleNames() const;

private:
public slots:
	void updateModel();
//	int getId();
};

#endif // TASKCARDITEMLIST_H
