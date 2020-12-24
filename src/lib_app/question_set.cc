#include "question_set.h"

namespace project
{
/*static*/ QString QuestionSet::AnswerForItWasTrickQuestion()
{
    return "~trap~";
}

QuestionSet::QuestionSet( const CliOptions& /*options*/ )
{
}

QuestionSet::~QuestionSet() = default;

QAndA QuestionSet::LoadNextQuestion()
{
    QAndA next;
    next.q = "test";
    next.a = "answer";
    return next;
}

bool QuestionSet::IsCorrectAnswer( const QString& answer )
{
    (void) answer;
    return true;
}

} // namespace project
