#include "widget.h"
#include "ui_widget.h"
#include <QHBoxLayout>
#include <QQmlComponent>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>
#include <QDockWidget>
#include <QQuickStyle>


ChatWidget::ChatWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    QBoxLayout *box = new QBoxLayout(QBoxLayout::BottomToTop, this);
    box->setSpacing(0);
    box->setMargin(0);


    //QQuickStyle::setStyle("Fusion");

    QQuickView * view = new QQuickView();
    //view->setColor(QColor("#000000"));
    //view->setOpacity(0.2);
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    //view->setWidth(this->width());
    //view->setHeight(this->height());
    view->setSource(QUrl("qrc:/chat.qml"));
    //view->show();

    m_context = view->engine()->rootContext();
    //QQmlContext * context = view->engine()->rootContext();
    //context->setContextProperty("mode", "disabled");

    //context->setContextProperty("width", this->width());
    //context->setContextProperty("height", this->height());



    //int width = context->contextProperty("width").toInt();
    //int height = context->contextProperty("height").toInt();
    //view->setIcon(QIcon(":/img/CONNECTED.png"));
    //view->setTitle(QString("chat"));

    //view->setWidth(this->width());
    //view->setHeight(this->height());
    //view->setPosition(this->x(), this->y());

    //qDebug() << "width is: " << context->contextProperty("width");

    QWidget *container = QWidget::createWindowContainer(view, this);
    container->setContextMenuPolicy(Qt::NoContextMenu);
    container->setContentsMargins(0, 0, 0, 0);
    //container->hide();
    //container->setMinimumSize(200, 200);
    //container->setMaximumSize(200, 200);
    container->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
    container->setFocusPolicy(Qt::StrongFocus);


    setWindowIcon(QIcon(":/chatelements/res/CONNECTED.png"));
    setWindowTitle(QString("QML chat"));
    setEnabled(false);
    setMinimumSize(200, 200);
    setMaximumSize(800, 800);

    setGeometry(100, 100, 800, 800);

    box->addWidget(container);
    setLayout(box);
}

void ChatWidget::resizeEvent(QResizeEvent *)
{
    qDebug() << "in resize event";
}

ChatWidget::~ChatWidget()
{
    delete ui;
}
