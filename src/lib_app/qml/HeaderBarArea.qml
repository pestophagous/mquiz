import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

Item {
  id: root

  Label {
    anchors.fill: parent
    padding: 30
    visible: !navigation.gameIsActive
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: "Jones Animal Quiz"

    font: Theme.solidIconStretchToMaxFitFont
    fontSizeMode: Text.Fit

    DebugRectangle {
    }
  }

  HeaderBarDuringGame {
    visible: navigation.gameIsActive
    anchors.fill: parent
  }
}
