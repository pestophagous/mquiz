import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

ApplicationWindow {
  id: root

  title: "Quiz Time"

  Material.theme: Material.Dark

  // Perform palette overrides at root ApplicationWindow to affect whole app:
  // palette.window: '#777777' // <-- when using QQuickStyle::setStyle, you can override palette
  width: 400
  height: 720
  visible: true
  Component.onCompleted: {
    // Don't mess with 'guiTests' log statements, or you risk breaking a test.
    console.log(LogTags.guiTests, "ApplicationWindow onCompleted")
  }

  ColumnLayout {
    anchors.fill: parent
    Item {
      Layout.preferredWidth: 1
      Layout.minimumHeight: 10
      Layout.maximumHeight: Layout.minimumHeight
    }
    HeaderBarArea {
      Layout.fillWidth: true
      Layout.minimumHeight: 100
      Layout.maximumHeight: Layout.minimumHeight
    }
    GamePanel {
      Layout.fillWidth: true
      Layout.fillHeight: true
    }
  }
}
