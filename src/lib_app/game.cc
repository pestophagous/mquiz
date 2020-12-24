#include "game.h"

#include <QtQml/QQmlContext>

#include <chrono>

#include "src/lib_app/question_set.h"
#include "src/lib_app/random_concrete.h"
#include "util-assert.h"

namespace project
{
namespace
{
constexpr int kSecondsPerQuestion = 20;
} // namespace

Game::Game( const CliOptions& /*options*/, QuestionSet* qs )
    : m_random( RandomConcrete::RandomConcreteForProduction() )
    , m_questions( qs )
{
    FASSERT( m_questions, "never nullptr" );

    connect( &m_countdownTimer, &QTimer::timeout, this, &Game::OnTimerTick );
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

QString Game::GetPartialPathToOopsImage()
{
    const int i = m_random->GetNextFromNToMInclusive( 1, 5 );
    m_partialPathToOopsImage = QStringLiteral( "images/oops%1.png" ).arg( i );
    return m_partialPathToOopsImage;
}

void Game::endTheGame()
{
    m_countdownTimer.stop();
    m_gameIsActive = false;
    emit eventEdgeOfGame();
    // Nice-to-have (future): save record high scores (or any other history, stats)
}

void Game::startOneGame()
{
    advance();
    m_gameIsActive = true;
    emit eventEdgeOfGame();
}

void Game::submitItWasTrickQuestion()
{
    m_countdownTimer.stop();
    const bool correct = m_questions->IsCorrectAnswer( QuestionSet::AnswerForItWasTrickQuestion() );
    IncrementAndEmitScore( correct );
}

void Game::advance()
{
    const QAndA qa = m_questions->LoadNextQuestion();
    m_prompt = qa.q;
    m_correctAnswer = qa.a;

    m_countdown = kSecondsPerQuestion;
    m_countdownTimer.setSingleShot( false );
    m_countdownTimer.setInterval( std::chrono::seconds( 1 ) );
    m_countdownTimer.start();

    emit eventNewQuestion();
    emit eventCountdownChanged();
}

void Game::typingTheAnswer( QString answer )
{
    const bool correct = m_questions->IsCorrectAnswer( answer );

    if( !correct )
    {
        // if incorrect we do nothing
        return;
    }

    // if correct
    m_countdownTimer.stop();
    IncrementAndEmitScore( true );
}

void Game::OnTimerTick()
{
    m_countdown--;

    if( m_countdown < 0 )
    {
        m_countdownTimer.stop();
        IncrementAndEmitScore( false );
        return;
    }

    emit eventCountdownChanged();
}

void Game::IncrementAndEmitScore( const bool correct )
{
    m_totalQuestionsScored++;
    if( correct )
    {
        m_countCorrect++;
    }
    emit eventVerdictRendered( correct );
}
} // namespace project
