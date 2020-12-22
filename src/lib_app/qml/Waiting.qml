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
    Item {
      Layout.preferredWidth: 1
      Layout.minimumHeight: 10
      Layout.maximumHeight: Layout.minimumHeight
    }

    Button {
      Layout.minimumHeight: 80
      Layout.maximumHeight: Layout.minimumHeight
      Layout.minimumWidth: 200
      Layout.maximumWidth: Layout.minimumWidth
      Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

      text: "Start"
      onClicked: {
        navigation.startOneGame()
      }
    }

    Item {
      Layout.preferredWidth: 1
      Layout.fillHeight: true
    }
  }
}
