#ifndef _ArrayBag_H_
#define _ArrayBag_H_

#include "../virtualInterface/Bag.h"


template<typename E>
class ArrayBag : public Bag<E>
{
private:
    E 
public:
    ArrayBag(E );
};

#include "../implementation/Bag.cpp"

#endif