import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import libstyles 1.0

Item {
  id: root

  property string text

  Item {
    anchors.fill: parent

    Label {
      id: icon
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.right: parent.right
      height: parent.height * 0.5
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter

      text: Fonts.fa_solid_clock // refer to Cheatsheet_Font_Awesome_Solid.pdf
      font: Theme.solidIconStretchToMaxFitFont
      fontSizeMode: Text.Fit
    }
    Label {
      anchors.top: icon.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      height: parent.height * 0.5

      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      font: Theme.solidIconStretchToMaxFitFont
      fontSizeMode: Text.Fit
      text: root.text
    }

    DebugRectangle {
    }
  }
}
