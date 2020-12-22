//
// Copyright (c) 2020, 219 Design, LLC
// See LICENSE.txt
//
// https://www.219design.com
// Software | Electrical | Mechanical | Product Design
//

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include "autogenerated/version.h" // USE THIS INCLUDE SPARINGLY. IT CAN TRIGGER REBUILDS.
#include "src/minutil/logger.h" // <--- included for DEMONSTRATION. Prefer Qt logging where available.
#include "util-assert.h"
#include "view_model_collection.h"

int main( int argc, char* argv[] )
{
    qSetMessagePattern( QString( "%{time yyyy-MM-dd hh:mm:ss} [QT-%{type}][v-" ) + project::GIT_HASH_WHEN_BUILT
                        + "][thr:%{threadid}]%{if-category}%{category}: %{endif}%{file}(%{line}): %{message}" );

    // project::log used for DEMONSTRATION. Prefer Qt logging where available.
    project::log( "main.cc starting now %d", static_cast<int>( __LINE__ ) );

    QGuiApplication app( argc, argv ); // ... note next line...
    QQuickStyle::setStyle( "Material" ); // <-- call setStyle after creating app (if style is needed)

    // ViewModels must OUTLIVE the qml engine, so create them first:
    project::ViewModelCollection vms( app );

    // For antialiasing: https://stackoverflow.com/a/49576756/10278
    // QSurfaceFormat format;
    // format.setSamples( 8 );
    //   LEAVING THIS HERE AS A "WARNING". This gave us good antialiasing on
    //   the QML ShapePath that it was intended to help. It DID help where we
    //   wanted it to help. But it also caused weird tiny lines to intermittently
    //   appear around some of our SVG icons.
    //   So now we use a different, QML-only tactic in the ShapePath.
    // QSurfaceFormat::setDefaultFormat( format );
    //
    // Instead, do this in the QML of your ShapePath:
    //    layer.enabled: true // Without this, the edges look "jaggy" and pixelated
    //    layer.samples: 4 // Without this, the edges look "jaggy" and pixelated

    // Created after vms, so that we avoid null vm qml warnings upon vm dtors
    QQmlApplicationEngine engine;

    vms.ExportContextPropertiesToQml( &engine );

    engine.addImportPath( "qrc:///" ); // needed for finding qml in our plugins
    engine.load( QUrl( QStringLiteral( "qrc:///qml/main.qml" ) ) );

    const QList<QObject*> objs = engine.rootObjects();
    FASSERT( objs.size() == 1, "if the app starts creating more than one root window, "
                               "please reevaluate the logic of SetRootObject and our global event filter" );
    vms.SetRootObject( objs[ 0 ] );

    return app.exec();
}
