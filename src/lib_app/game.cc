#include "game.h"

#include <QtQml/QQmlContext>

namespace project
{
Game::Game( const CliOptions& /*options*/ )
{
}

Game::~Game() = default;

void Game::ExportContextPropertiesToQml( QQmlEngine* engine )
{
    engine->rootContext()->setContextProperty( "navigation", this );
    engine->rootContext()->setContextProperty( "game", this );
}

bool Game::GetGameIsActive() const
{
    return m_gameIsActive;
}

QString Game::GetPrompt() const
{
    return m_prompt;
}

QString Game::GetCorrectAnswer() const
{
    return m_correctAnswer;
}

int Game::GetCountdown() const
{
    return m_countdown;
}

int Game::GetCountCorrect() const
{
    return m_countCorrect;
}

int Game::GetTotalQuestionsScored() const
{
    return m_totalQuestionsScored;
}

QString Game::GetPartialPathToOopsImage() const
{
    return m_partialPathToOopsImage;
}

void Game::endTheGame()
{
    // stop any countdown timer.

    //void eventEdgeOfGame();

    // Nice-to-have (future): save record high scores (or any other history, stats)
}

void Game::startOneGame()
{
    // void eventCountdownChanged();
    // void eventNewQuestion();
    // void eventEdgeOfGame();
}

void Game::submitItWasTrickQuestion()
{
    // stop any countdown timer

    //   void eventVerdictRendered( bool ); // true if answer is correct. false otherwise.

    //void eventNewQuestion();
}

void Game::advance()
{
}

void Game::typingTheAnswer( QString answer )
{
    (void) answer;

    // if incorrect we do nothing

    // if correct

    // stop any countdown timer

    //void eventVerdictRendered( bool ); // true if answer is correct. false otherwise.
}

} // namespace project
