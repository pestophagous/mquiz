import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

Item {
  id: root

  ImageSvgHelper {
    anchors.fill: parent

    source: resourceHelper.imageSourcePrefix + game.partialPathToOopsImage
    fillMode: Image.PreserveAspectFit
  }
  Button {
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter

    height: 50
    width: 125

    text: "Next"

    onClicked: {
      game.advance()
    }
  }
}
