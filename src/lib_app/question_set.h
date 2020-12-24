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

namespace project
{
class CliOptions;

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
};

} // namespace project

#endif // PROJECT_LIB_QUESTION_SET_H
