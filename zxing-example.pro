TARGET = zxing-example

CONFIG += sailfishapp c++11 qzxing_multimedia

include(lib/qzxing/QZXing.pri)

SOURCES += src/zxing-example.cpp

OTHER_FILES += qml/zxing-example.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/zxing-example.changes.in \
    rpm/zxing-example.spec \
    rpm/zxing-example.yaml \
    translations/*.ts \
    zxing-example.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/zxing-example-de.ts
