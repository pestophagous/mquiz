//
// Copyright (c) 2020, 219 Design, LLC
// See LICENSE.txt
//
// https://www.219design.com
// Software | Electrical | Mechanical | Product Design
//
#ifndef PROJECT_LIB_QUESTION_SET_H
#define PROJECT_LIB_QUESTION_SET_H

#include <QString>

#include <memory>
#include <vector>

namespace project
{
class CliOptions;
class RandomConcrete;

struct QAndA
{
    QString q;
    QString a;
};

class QuestionSet
{
public:
    static QString AnswerForItWasTrickQuestion();

    explicit QuestionSet( const CliOptions& options );
    virtual ~QuestionSet();

    QuestionSet( const QuestionSet& ) = delete;
    QuestionSet& operator=( const QuestionSet& ) = delete;

    QAndA LoadNextQuestion();
    bool IsCorrectAnswer( const QString& answer );

private:
    struct QAndA1AndA2
    {
        QString q;
        QString a1;
        QString a2;
    };

    const std::unique_ptr<RandomConcrete> m_random;

    std::vector<QAndA1AndA2> m_all;
    std::vector<QAndA1AndA2> m_unused;

    QAndA1AndA2 m_currentItem;
};

} // namespace project

#endif // PROJECT_LIB_QUESTION_SET_H
