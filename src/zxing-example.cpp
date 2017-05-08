#include <QtQuick>

#include <sailfishapp.h>
#include <QZXing.h>


int main(int argc, char *argv[]) {
    QZXing::registerQMLTypes();
    return SailfishApp::main(argc, argv);
}
