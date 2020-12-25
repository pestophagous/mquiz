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

    Item {
      Layout.fillHeight: true

      Layout.minimumWidth: 80
      Layout.maximumWidth: Layout.minimumWidth
      Layout.rightMargin: 18
      Layout.leftMargin: Layout.rightMargin

      Label {
        id: icon
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: Fonts.fa_solid_door_open // refer to Cheatsheet_Font_Awesome_Solid.pdf
        font: Theme.solidIconStretchToMaxFitFont
        fontSizeMode: Text.Fit
      }
      Label {
        anchors.top: icon.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.2

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: Theme.solidIconStretchToMaxFitFont
        fontSizeMode: Text.Fit
        text: "Exit"
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          navigation.endTheGame()
        }
      }
      DebugRectangle {
      }
    }

    Label {
      Layout.fillHeight: true
      Layout.fillWidth: true

      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: "Score: " + game.countCorrect + "/" + game.totalQuestionsScored
      DebugRectangle {
      }
    }
  }
}
