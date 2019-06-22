#include "diamond.h"

#include <QJsonDocument>

Diamond::Diamond(QObject *parent) : QObject(parent)
{

}

Diamond::Diamond(int diamond):m_diamond(diamond)
{
    m_diamond = 0;
}

int Diamond::diamond() const
{
    return  m_diamond ;

}

void Diamond::setDiamond( int diamond)
{
    m_diamond = diamond;
}

bool Diamond::loadDiamond()
{
    QFile loadFile("diamond.json");

    if(!loadFile.open(QIODevice::ReadOnly)){
        qWarning("couldn't open save file.");
        return false;
    }
    QByteArray saveData = loadFile.readAll();
    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    read(loadDoc.object());

    qDebug() << "load file successfully";
    return true;
}

bool Diamond::saveDiamond( ) const
{
    QFile saveFile(QStringLiteral("diamond.json"));

    if (!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);
    saveFile.write(saveDoc.toJson());

    qDebug() << "save file successfully";
    return true;

}

void Diamond::read(const QJsonObject &json)
{
    if(json.contains("diamond") && json["diamond"].isDouble())
        m_diamond = json["diamond"].toInt();
}

void Diamond::write(QJsonObject &json) const
{
    json["diamond"] = m_diamond;
}



void Diamond::Print()
{
    qDebug() << m_diamond;
}

void Diamond::onDiamondChanged( )
{
    saveDiamond();
}

