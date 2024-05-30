#include "../h/syscall_cpp.hpp"
#include "../h/tcb.hpp"

char Console::getc()
{
    return ::getc();
}

void Console::putc(char c)
{
    ::putc(c);
}

void Thread::initialize()
{
    myHandle = new TCB();
    myHandle->body = thrBody;
    myHandle->arguments = argument;
}

void Thread::unitialize()
{
    if(myHandle->isFinished())
        delete myHandle;
}

Thread::Thread()
    :
    thrBody(nullptr),
    argument(nullptr)
{
    initialize();
}

Thread::Thread(void (*body)(void *), void *arg)
    :
    thrBody(body),
    argument(arg)
{
    initialize();
}

Thread::~Thread() noexcept
{
    unitialize();
}

int Thread::start()
{
    if (myHandle->body)
    {
        return thread_create(&myHandle, myHandle->body, myHandle->arguments);
    }
    // body == nullptr ----> call run method
    return thread_create(&myHandle, TCB::ThreadClassWrapper, this);
}

void Thread::dispatch()
{
    thread_dispatch();
}

int Thread::GetThreadID() const
{
    return myHandle->getThrID();
}

Semaphore::Semaphore(uint init )
{
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore()
{
    sem_close(myHandle);
}

int Semaphore::wait()
{
    return sem_wait(myHandle);
}

int Semaphore::signal()
{
    return sem_signal(myHandle);
}

int Semaphore::timedWait(time_t time)
{
    return 0;
}

int Semaphore::tryWait()
{
    return  sem_trywait(myHandle);
}