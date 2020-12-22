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
      Layout.fillWidth: true
      Layout.minimumHeight: 100
      Layout.maximumHeight: Layout.minimumHeight
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter

      text: "the name"

      onTextChanged: {
        root.nameChanged(text)
      }

      /*
      Connections {
        target: Qt.inputMethod
        function onVisibleChanged() {
          configureUnitViewModel.setKeyboardIsOpen(Qt.inputMethod.visible)
        }
      }
      */
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
        text: "10-9"
        DebugRectangle {
        }
      }

      Button {
        Layout.fillHeight: true
        Layout.fillWidth: true

        text: "Trick!"
      }
    }

    Label {
      Layout.fillWidth: true
      Layout.minimumHeight: 300
      Layout.maximumHeight: Layout.minimumHeight

      verticalAlignment: Text.AlignTop
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas augue diam, sit amet gravida leo ultrices non. Curabitur eleifend nisl a nibh condimentum, id vehicula ipsum tempor. Etiam dictum pulvinar lobortis. Quisque eu nisl vel tortor imperdiet semper sit amet sit amet nibh. Nunc neque mauris, blandit eu semper vitae, molestie sit amet nisl. Nunc dignissim odio non libero posuere venenatis. Maecenas accumsan, nunc vel convallis finibus, lorem ex luctus odio, lacinia varius purus nibh hendrerit ante. Nullam pharetra lorem id diam sagittis vulputate ornare sit amet tellus. Vivamus in velit orci."
      wrapMode: Text.Wrap
      DebugRectangle {
      }
    }

    Label {
      Layout.fillWidth: true
      Layout.fillHeight: true
      verticalAlignment: Text.AlignTop
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas augue diam, sit amet gravida leo ultrices non. Curabitur eleifend nisl a nibh condimentum, id vehicula ipsum tempor. Etiam dictum pulvinar lobortis. Quisque eu nisl vel tortor imperdiet semper sit amet sit amet nibh. Nunc neque mauris, blandit eu semper vitae, molestie sit amet nisl. Nunc dignissim odio non libero posuere venenatis. Maecenas accumsan, nunc vel convallis finibus, lorem ex luctus odio, lacinia varius purus nibh hendrerit ante. Nullam pharetra lorem id diam sagittis vulputate ornare sit amet tellus. Vivamus in velit orci."
      wrapMode: Text.Wrap
      DebugRectangle {
      }
    }
  }
}
