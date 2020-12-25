#include "question_set.h"

#include <QDebug>
#include <QFile>

#include "src/lib_app/random_concrete.h"
#include "util-assert.h"

namespace project
{
/*static*/ QString QuestionSet::AnswerForItWasTrickQuestion()
{
    return "~trap~";
}

QuestionSet::QuestionSet( const CliOptions& /*options*/ )
    : m_random( RandomConcrete::RandomConcreteForProduction() )
{
    QFile f( ":data/quiz.txt" );
    if( !f.open( QIODevice::ReadOnly | QIODevice::Text ) )
    {
        FFAIL( "quiz.txt is in qrc. must always be there." );
    }

    while( !f.atEnd() )
    {
        QString line = f.readLine().trimmed();
        if( !line.isEmpty() )
        {
            QStringList parts = line.split( QLatin1Char( '|' ) );
            if( parts.size() > 1 )
            {
                QAndA1AndA2 item;
                item.q = parts[ 0 ];
                item.a1 = parts[ 1 ];
                if( parts.size() > 2 )
                {
                    item.a2 = parts[ 2 ];
                }
                else
                {
                    item.a2 = item.a1;
                }
                m_all.push_back( item );
            }
        }
    }
    m_unused = m_all;
}

QuestionSet::~QuestionSet() = default;

QAndA QuestionSet::LoadNextQuestion()
{
    int i = 0;
    if( m_unused.size() > 1 )
    {
        i = m_random->GetNextFromNToMInclusive( 0, static_cast<int>( m_unused.size() ) - 1 );
    }
    const size_t idx = static_cast<size_t>( i );
    m_currentItem = m_unused[ idx ];

    m_unused.erase( m_unused.begin() + idx );
    if( m_unused.empty() )
    {
        m_unused = m_all;
    }

    QAndA next;
    next.q = m_currentItem.q;
    next.a = m_currentItem.a2;
    return next;
}

bool QuestionSet::IsCorrectAnswer( const QString& answer )
{
    return answer.contains( m_currentItem.a1, Qt::CaseInsensitive )
           || answer.contains( m_currentItem.a2, Qt::CaseInsensitive );
}

} // namespace project
