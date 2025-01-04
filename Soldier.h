#ifndef SOLDIER_H
#define SOLDIER_H
#include <QObject>
class Soldier : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int Y WRITE setY READ getY NOTIFY changeY);
    Q_PROPERTY(int point READ getPoint WRITE setPoint NOTIFY pointChanged)
public:
    explicit Soldier(QObject *parent = nullptr);

    // Getter e Setter per la posizione Y
    int getY() const;
    void setY(int y);

    // Getter e Setter per il punteggio
    int getPoint() const;
    void setPoint(int point);

    // Metodo per far saltare il soldato
    void jump();

Q_SIGNALS:
    int pointChanged();
    void changeY();
private:
    int m_y;        // Posizione Y del soldato
    int m_point;    // Punteggio
    QTimer *m_timer;
};


#endif // SOLDIER_H
