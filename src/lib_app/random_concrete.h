//
// Copyright (c) 2020, pestophagous (pestophagous@users.noreply.github.com)
// See LICENSE.txt
//
// https://github.com/pestophagous/
//
#ifndef PROJECT_UTIL_RANDOM_CONCRETE_H
#define PROJECT_UTIL_RANDOM_CONCRETE_H

#include <memory>

namespace project
{
class RandomConcrete
{
public:
    static std::unique_ptr<RandomConcrete> RandomConcreteForProduction();
    static std::unique_ptr<RandomConcrete> RandomConcreteForTests();
    virtual ~RandomConcrete();

    int GetNextFromNToMInclusive( int n, int m );
    // For subtypes that use a repeatable seed (for testing), this will restart the
    // random sequence, once again seeding it with the repeatable seed.
    void Reset();

private:
    explicit RandomConcrete( bool repeatableSeed );

    const bool m_usingRepeatableSeed;
    struct Impl;
    std::unique_ptr<Impl> m_impl;
};

} // namespace project

#endif // PROJECT_UTIL_RANDOM_CONCRETE_H
