import QtQuick 2.12

QtObject {
  id: nav

  property bool gameIsActive: false

  function endTheGame() {
    nav.gameIsActive = false
  }

  function startOneGame() {
    nav.gameIsActive = true
  }
}
