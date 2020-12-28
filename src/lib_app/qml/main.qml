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

  function getRandom(min, max) {
    return Math.random() * (max - min) + min
  }

  Flickable {
    id: f
    anchors.fill: parent

    flickableDirection: Flickable.HorizontalFlick
    clip: true

    contentX: 800

    contentHeight: 800
    contentWidth: 1200

    ImageSvgHelper {
      height: 800
      width: 1200
      source: resourceHelper.imageSourcePrefix + 'images/background.png'

      ImageSvgHelper {
        id: purrmaid
        x: getRandom(0, 1200)
        y: getRandom(0, 800)
        height: 49
        width: 40
        source: resourceHelper.imageSourcePrefix + 'images/c1.png'
      }
    }
  }

  Button {
    anchors.top: parent.top
    anchors.left: parent.left
    text: "New"
    onClicked: {
      purrmaid.x = getRandom(0, 1200)
      purrmaid.y = getRandom(0, 800)
    }
  }

  Button {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    text: "<"
    onClicked: {
      f.contentX = f.contentX - 400
    }
  }

  Button {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    text: ">"
    onClicked: {
      f.contentX = f.contentX + 400
    }
  }

  /*
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
  }*/
}
