import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

Item {
  id: root

  RowLayout {
    anchors.fill: parent

    Label {
      Layout.fillHeight: true

      Layout.minimumWidth: 80
      Layout.maximumWidth: Layout.minimumWidth

      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: "XX"
      DebugRectangle {
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          navigation.endTheGame()
        }
      }
    }

    Label {
      Layout.fillHeight: true
      Layout.fillWidth: true

      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: "Score"
      DebugRectangle {
      }
    }
  }
}
