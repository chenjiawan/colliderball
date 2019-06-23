#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QJsonObject>
#include <QObject>
#include <QString>
#include "QDebug"
#include <QFile>


class Diamond : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int diamond READ diamond WRITE setDiamond NOTIFY diamondChanged)
public:
    explicit Diamond(QObject *parent = nullptr);

    Diamond(int diamond);

    int diamond() const;
    void setDiamond(int diamond );

    bool loadDiamond();
    bool saveDiamond( ) const;

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    void Print();

signals:
    void diamondChanged();

public slots:

    void load();
    void onDiamondChanged();
private:
    int m_diamond;
};

#endif // PLAYER_H
