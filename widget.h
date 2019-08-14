#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QQuickWidget>

namespace Ui {
class Widget;
}

class ChatWidget : public QWidget
{
    Q_OBJECT

public:
    explicit ChatWidget(QWidget *parent = nullptr);
    virtual void resizeEvent(QResizeEvent * ev) override;
    ~ChatWidget() override;

private:
    Ui::Widget *ui;
    QQuickWidget* m_quickWidget;
    QQmlContext * m_context;
};

#endif // WIDGET_H
