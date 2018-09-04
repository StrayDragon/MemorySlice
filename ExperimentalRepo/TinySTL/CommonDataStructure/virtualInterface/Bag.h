#ifndef _Bag_H_
#define _Bag_H_

#include <vector>
using namespace std;

template <typename E>
class Bag {
   public:
    virtual int getCurrentSize() const = 0;
    virtual int getFrequencyOf(const E& anEntry) const = 0;
    virtual bool isEmpty() const = 0;
    virtual bool add(const E& newEntry) = 0;
    virtual bool remove(const E& anEntry) = 0;
    virtual void clear() = 0;
    virtual bool contains(const E& anEntry) const = 0;
    virtual vector<E> toVector() const = 0;
};

#include "../implementation/Bag.cpp"
#endif