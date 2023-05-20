#ifndef TOMATODOTASKITEM_H
#define TOMATODOTASKITEM_H

#include <QObject>
#include <QVector>

struct TaskItem {
	int id;
	QString taskName;
	QString taskDay;
	int originalPodomoro;
	int remainingPodomoro;
	bool isCompleted;
	QString deadline;
};

class TomatodoTaskItem:QObject
{
	Q_OBJECT
public:
	TomatodoTaskItem();


private:
	QVector<TaskItem> taskItemList;
};

#endif // TOMATODOTASKITEM_H
