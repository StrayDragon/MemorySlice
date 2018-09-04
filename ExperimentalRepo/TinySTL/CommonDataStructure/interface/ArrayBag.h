#ifndef _ListBag_H_
#define _ListBag_H_

#include "../virtualInterface/Bag.h"


template<typename E>
class ListBag : public Bag<E>
{
private:
    E 
public:
    ListBag(E );
};

#include "../implementation/Bag.cpp"

#endif