#ifndef _UTIL_HPP_
#define _UTIL_HPP_

#include "../lib/hw.h"

namespace SysCallRegistersID
{
    // memory
    const size_t _MEM_ALLOC = 1;
    const size_t _MEM_FREE = 2;

    // thread
    const size_t _THREAD_CREATE = 11;
    const size_t _THREAD_EXIT = 12;
    const size_t _THREAD_DISPATCH = 13;

    // semaphore
    const size_t _SEM_OPEN = 21;
    const size_t _SEM_CLOSE = 22;
    const size_t _SEM_WAIT = 23;
    const size_t _SEM_SIGNAL = 24;
    const size_t _SEM_TIMEDWAIT = 25;
    const size_t _SEM_TRYWAIT = 26;

    // sleep
    const size_t _TIMESLEEP = 31;

    // console
    const size_t _GETC = 41;
    const size_t _PUTC = 42;
}

class ListSysCallRegs
{
private:
    struct Elem
    {
        size_t data;
        Elem* next;
        Elem(size_t _data, Elem* _next=nullptr) : data(_data), next(_next){}
    };
    Elem* head;
    Elem* tail;

    void AddElem(size_t data)
    {
        Elem* elem = new Elem(data);
        elem->data = data;
        elem->next= nullptr;
        if (tail)
        {
            tail->next = elem;
            tail = elem;
        } else
        {
            head = tail = elem;
        }
    }
public:
    ListSysCallRegs() : head(nullptr), tail(nullptr){}
    ListSysCallRegs(const ListSysCallRegs&) = delete;
    ListSysCallRegs& operator=(const ListSysCallRegs&) = delete;

    bool contains(size_t elem)
    {
        for(Elem *curr = head; curr && curr != tail; curr = curr->next)
        {
            if(curr->data == elem) return true;
        }
        return false;
    }

    void initListSysCallRegs()
    {
        AddElem(SysCallRegistersID::_MEM_ALLOC);
        AddElem(SysCallRegistersID::_MEM_FREE);

        AddElem(SysCallRegistersID::_THREAD_CREATE);
        AddElem(SysCallRegistersID::_THREAD_EXIT);
        AddElem(SysCallRegistersID::_THREAD_DISPATCH);

        AddElem(SysCallRegistersID::_SEM_OPEN);
        AddElem(SysCallRegistersID::_SEM_CLOSE);
        AddElem(SysCallRegistersID::_SEM_WAIT);
        AddElem(SysCallRegistersID::_SEM_SIGNAL);
        AddElem(SysCallRegistersID::_SEM_TIMEDWAIT);
        AddElem(SysCallRegistersID::_SEM_TRYWAIT);

        AddElem(SysCallRegistersID::_TIMESLEEP);

        AddElem(SysCallRegistersID::_GETC);
        AddElem(SysCallRegistersID::_PUTC);
    }
};
#endif // _UTIL_HPP_