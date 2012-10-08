#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"

#include "canvas.h"
#include "canvastimer.h"
#include "context2d.h"

#include "qcanvas.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Canvas>("Canvas", 1, 0, "Canvas");
    qmlRegisterType<Context2D>("Context2D", 1, 0, "Context2D");
    qmlRegisterUncreatableType<CanvasImage>("CanvasImage", 1, 0, "CanvasImage", QString());
    qmlRegisterUncreatableType<CanvasGradient>("Gradient", 1, 0, "Gradient", QString());

    qmlRegisterType<QCanvas>("QCanvas", 1, 0, "QCanvas");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/SmileApp/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
