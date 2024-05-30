#ifndef _SYSCALL_CPP_HPP_
#define _SYSCALL_CPP_HPP_
#include "../h/syscall_c.hpp"

class Thread
{
    friend class TCB;
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);

    int GetThreadID() const;
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
    using ThrBody = void (*)(void *);
    ThrBody thrBody;
    void* argument;

    void initialize();
    void unitialize();
};

class Console
{
public:
    static char getc();
    static void putc(char c);
};
#endif //_SYSCALL_CPP_HPP_
