# 'pri' usage based on http://archive.is/https://www.toptal.com/qt/vital-guide-qmake

!include($$top_srcdir/android.pri) { error() }

INCLUDEPATH += $${top_srcdir}
LIBS += -L$$shadowed($$PWD) -ltestmain$${our_android_lib_suffix}
