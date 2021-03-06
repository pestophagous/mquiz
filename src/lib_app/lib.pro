!include($$top_srcdir/compiler_flags.pri) { error() }

QT += core qml quick svg widgets

TEMPLATE = lib
!ios {
  CONFIG += shared
}

RESOURCES = libresources.qrc

SOURCES += \
    cli_options.cc \
    game.cc \
    lib.cc \
    logging_tags.cc \
    question_set.cc \
    random_concrete.cc \
    resources.cc

HEADERS += \
    cli_options.h \
    game.h \
    lib.h \
    logging_tags.h \
    question_set.h \
    random_concrete.h \
    resources.h

# 'pri' usage based on http://archive.is/https://www.toptal.com/qt/vital-guide-qmake
!include(../libstyles/libstyles.pri) { error() }
!include(../util/util.pri) { error() }

TARGET = app

target.path = $$top_exe_dir
INSTALLS += target
