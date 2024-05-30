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


Thread::Thread()
{
    myHandle = new TCB();
    myHandle->body = nullptr;
    myHandle->arguments = nullptr;
}

Thread::Thread(void (*body)(void *), void *arg)
{
    myHandle = new TCB();
    myHandle->body = body;
    myHandle->arguments = arg;
}

Thread::~Thread() noexcept
{
    TCB* handle = this->myHandle;
    if(handle)
    {
        if (handle->isFinished())
        {
            delete handle;
        }
    }
}

int Thread::start()
{
   // if (myHandle->started) { return -1; }
    TCB::Body body = myHandle->body;
    void *arg = myHandle->arguments;
    delete myHandle;
    if (body == nullptr)
    {
        return thread_create(&myHandle, TCB::ThreadClassWrapper, this);
    }
    else
    {
        return thread_create(&myHandle, body, arg);
    }
}

void Thread::dispatch()
{
    thread_dispatch();
}