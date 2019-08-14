#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCoreApplication>

#include <QMainWindow>
#include <QHBoxLayout>
#include <QQmlComponent>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>
#include <QDockWidget>

#include "widget.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickWindow::setSceneGraphBackend(QSGRendererInterface::Software);

    QDockWidget mydock;

    ChatWidget w;
    w.show();

    //mydock.setWidget(&w);
    //mydock.show();

    return app.exec();
}
