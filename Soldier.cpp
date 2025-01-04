#include "Soldier.h"
#include <QTimer>

Soldier::Soldier(QObject *parent) : QObject(parent), m_y(0), m_point(0)
{
    // Inizializzare il timer
    m_timer = new QTimer(this);
    connect(m_timer, &QTimer::timeout, this, &Soldier::jump);
    m_timer->start(1000);  // Ogni secondo aumenta il punteggio
}

int Soldier::getY() const {
    return m_y;
}

void Soldier::setY(int y) {
    if (m_y != y) {
        m_y = y;
        emit changeY();
    }
}

int Soldier::getPoint() const {
    return m_point;
}

void Soldier::setPoint(int point) {
    if (m_point != point) {
        m_point = point;
        emit pointChanged();
    }
}

void Soldier::jump() {
    // Logica del salto: ad esempio, aumenta la Y e la ripristina dopo un po'
    setY(m_y - 50);  // Esempio: aumenta la posizione Y per simulare il salto

    // Dopo un breve periodo, ripristina la Y
    QTimer::singleShot(300, this, [this]() {
        setY(m_y + 50); // Ripristina la Y dopo 300 ms
    });
}

