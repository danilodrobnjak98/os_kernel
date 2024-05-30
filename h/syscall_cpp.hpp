#ifndef _SYSCALL_CPP_HPP_
#define _SYSCALL_CPP_HPP_
#include "../h/syscall_c.hpp"

class Thread
{
    friend class TCB;
    friend class Scheduler;

public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
};

class Console
{
public:
    static char getc();
    static void putc(char c);
};
#endif //_SYSCALL_CPP_HPP_
