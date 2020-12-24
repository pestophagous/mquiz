//
// Copyright (c) 2020, 219 Design, LLC
// See LICENSE.txt
//
// https://www.219design.com
// Software | Electrical | Mechanical | Product Design
//
#ifndef PROJECT_LIB_GAME_H
#define PROJECT_LIB_GAME_H

#include <QTimer>
#include <QtCore/QObject>
#include <QtQml/QQmlEngine>

#include <memory>

namespace project
{
class CliOptions;
class QuestionSet;
class RandomConcrete;

class Game : public QObject
{
    Q_OBJECT

    // clang-format off

    Q_PROPERTY( bool gameIsActive
                READ GetGameIsActive
                NOTIFY eventEdgeOfGame )

    Q_PROPERTY( QString prompt
                READ GetPrompt
                NOTIFY eventNewQuestion )

    Q_PROPERTY( QString correctAnswer
                READ GetCorrectAnswer
                NOTIFY eventNewQuestion )

    Q_PROPERTY( int countdown
                READ GetCountdown
                NOTIFY eventCountdownChanged )

    Q_PROPERTY( int countCorrect
                READ GetCountCorrect
                NOTIFY eventVerdictRendered )

    Q_PROPERTY( int totalQuestionsScored
                READ GetTotalQuestionsScored
                NOTIFY eventVerdictRendered )

    Q_PROPERTY( QString partialPathToOopsImage
                READ GetPartialPathToOopsImage
                NOTIFY eventVerdictRendered )

    // clang-format on

public:
    explicit Game( const CliOptions& options, QuestionSet* qs );
    ~Game() override;

    Game( const Game& ) = delete;
    Game& operator=( const Game& ) = delete;

    void ExportContextPropertiesToQml( QQmlEngine* engine );

    bool GetGameIsActive() const;
    QString GetPrompt() const;
    QString GetCorrectAnswer() const;
    int GetCountdown() const;
    int GetCountCorrect() const;
    int GetTotalQuestionsScored() const;
    QString GetPartialPathToOopsImage();

    Q_INVOKABLE void endTheGame();
    Q_INVOKABLE void startOneGame();

    Q_INVOKABLE void advance();

    Q_INVOKABLE void submitItWasTrickQuestion();
    Q_INVOKABLE void typingTheAnswer( QString answer );

signals:
    void eventCountdownChanged();
    void eventVerdictRendered( bool correct ); // true if answer is correct. false otherwise.
    void eventNewQuestion();
    void eventEdgeOfGame();

private slots:
    void OnTimerTick();

private:
    void IncrementAndEmitScore( bool correct );

    const std::unique_ptr<RandomConcrete> m_random;

    QuestionSet* m_questions = nullptr;
    QTimer m_countdownTimer;

    bool m_gameIsActive = false;
    QString m_prompt;
    QString m_correctAnswer;
    int m_countdown = 0;
    int m_countCorrect = 0;
    int m_totalQuestionsScored = 0;
    QString m_partialPathToOopsImage;
};

} // namespace project

#endif // PROJECT_LIB_GAME_H
