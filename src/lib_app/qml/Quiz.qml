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

    TextField {
      id: yourAnswer
      Layout.fillWidth: true
      Layout.minimumHeight: 100
      Layout.maximumHeight: Layout.minimumHeight
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter

      enabled: !verdictPanel.visible

      text: ""

      onTextChanged: {
        if (text.length > 0) {
          game.typingTheAnswer(text)
        }
      }

      /*
      Connections {
        target: Qt.inputMethod
        function onVisibleChanged() {
          configureUnitViewModel.setKeyboardIsOpen(Qt.inputMethod.visible)
        }
      }
      */
      Connections {
        target: game

        function onEventNewQuestion() {
          yourAnswer.text = ""
        }
      }
    }

    RowLayout {
      Layout.fillWidth: true
      Layout.minimumHeight: 100
      Layout.maximumHeight: Layout.minimumHeight

      Label {
        Layout.fillHeight: true

        Layout.minimumWidth: 110
        Layout.maximumWidth: Layout.minimumWidth

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: game.countdown
        DebugRectangle {
        }
      }

      Button {
        Layout.fillHeight: true
        Layout.fillWidth: true

        text: "Trick!"
        onClicked: {
          game.submitItWasTrickQuestion()
        }
      }
    }

    Label {
      Layout.fillWidth: true
      Layout.minimumHeight: 50
      Layout.maximumHeight: Layout.minimumHeight

      verticalAlignment: Text.AlignTop
      text: game.prompt
      wrapMode: Text.Wrap
      DebugRectangle {
      }
    }

    Verdict {
      id: verdictPanel
      Layout.fillWidth: true
      Layout.fillHeight: true
      visible: false

      Connections {
        target: game

        function onEventVerdictRendered(correct) {
          verdictPanel.visible = true
          verdictPanel.userGaveCorrectAnswer = correct
        }

        function onEventNewQuestion() {
          verdictPanel.visible = false
        }
      }

      DebugRectangle {
      }
    }

    Item {
      id: verdictPanelPlaceholder
      Layout.fillWidth: true
      Layout.fillHeight: true
      visible: !verdictPanel.visible
    }
  }
}
