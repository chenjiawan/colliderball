#ifndef DATA_H
#define DATA_H
#include <QObject>

class GameData : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(int gameData MEMBER m_diamond)

private:
    int m_diamond = 0;

};
#endif // DATA_H
