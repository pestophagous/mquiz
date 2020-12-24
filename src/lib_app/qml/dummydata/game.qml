import QtQuick 2.12

QtObject {
  id: dummygame

  signal eventVerdictRendered(bool correct)
  signal eventNewQuestion

  property string prompt: "the prompt"
  property string correctAnswer: "correct answer description"
  property int countdown: 9
  property int countCorrect: 0
  property int totalQuestionsScored: 3
  property string partialPathToOopsImage: "images/oops2.png"

  property bool lastVerdict_: true

  function advance() {
    dummygame.eventNewQuestion()
  }

  function submitItWasTrickQuestion() {
    dummygame.typingTheAnswer("")
  }

  function typingTheAnswer(a) {
    dummygame.eventVerdictRendered(dummygame.lastVerdict_)
    dummygame.lastVerdict_ = !dummygame.lastVerdict_
  }
}
