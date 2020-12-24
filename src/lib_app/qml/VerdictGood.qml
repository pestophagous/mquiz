import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

Item {
  id: root

  ColumnLayout {
    anchors.fill: parent

    Label {
      Layout.fillWidth: true
      Layout.minimumHeight: 60
      Layout.maximumHeight: Layout.minimumHeight

      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter

      text: "Correct! " + game.correctAnswer

      DebugRectangle {
      }
    }

    Button {
      Layout.fillHeight: true
      Layout.fillWidth: true

      text: "Next"
      onClicked: {
        game.advance()
      }
    }
  }
}
