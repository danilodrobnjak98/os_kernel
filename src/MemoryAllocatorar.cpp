#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"

MemBlock* MemoryAllocator::m_head;
MemBlock* MemoryAllocator::m_used;
MemBlockUsed* MemoryAllocator::m_used_head;
MemBlockUsed* MemoryAllocator::m_used_tail;
size_t MemoryAllocator::MAX_SIZE_MEMORY_ALLOCATOR;

MemBlock::MemBlock(size_t sz)
        :
        size(sz),
        next(nullptr),
        prev(nullptr),
        isUsed(false)
{

}

MemBlock::MemBlock()
        :
        size(0),
        next(nullptr),
        prev(nullptr),
        isUsed(false)
{

}

void MemoryAllocator::printString(char const *string)
{
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
}

void MemoryAllocator::mem_init()
{
    m_head = (MemBlock*)HEAP_START_ADDR;
    m_head->size = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR;
    m_head->next = m_head->prev = nullptr;
    m_head->isUsed = false;
    MAX_SIZE_MEMORY_ALLOCATOR = m_head->size;
    m_used_head = m_used_tail = nullptr;
}

size_t MemoryAllocator::calculate_size(size_t size)
{
    bool actualSize = size > MEM_BLOCK_SIZE;
    size_t realSize = actualSize ? ((size / MEM_BLOCK_SIZE) + 1) * MEM_BLOCK_SIZE : MEM_BLOCK_SIZE;
    realSize += sizeof(MemBlock);
    return  realSize;
}

MemBlock* MemoryAllocator::find_best_fit(size_t size)
{
    size_t minAvailableSize = 0xFFFFFFFFFFFF; // max uint64 size
    MemBlock* best_fit = nullptr;
    for(MemBlock* current = m_head;current != nullptr; current = current->next)
    {
        if(current->size >= size && !current->isUsed && current->size < minAvailableSize)
        {
            best_fit = current;
            minAvailableSize = current->size;
        }
    }
    return best_fit;
}

void* MemoryAllocator::mem_alloc(size_t size)
{
    if(m_head == nullptr)
    {
        printString("ERROR: list of free fragments is empty\n");
        return nullptr;
    }

    if(size <= 0)
    {
        printString("ERROR: invalid argument\n");
        return nullptr;
    }

    size_t sz = calculate_size(size);
    if(sz > MAX_SIZE_MEMORY_ALLOCATOR)
    {
        printString("ERROR: Not enough space! \n");
        return nullptr;
    }

    MemBlock* best_fit = find_best_fit(sz);
    if(best_fit == nullptr)
    {
        printString("ERROR: couldn't find best fit\n");
        return nullptr;
    }

    best_fit->size = best_fit->size - sz;
    MemBlock* newMemBlock = (MemBlock*)((char*)best_fit + best_fit->size);
    bool used = true;
    newMemBlock->size = sz;
    newMemBlock->isUsed = used;

    newMemBlock->next = best_fit->next;
    newMemBlock->prev = best_fit;

    best_fit->next = newMemBlock;

    if (newMemBlock->next)
    {
        newMemBlock->next->prev = newMemBlock;
    }

    // adding in list of all used fragments
    if(m_used == nullptr)
    {
        m_used = newMemBlock;
        return (void*)((char*)newMemBlock + sizeof(MemBlock));
    }

    MemBlock* ptr = m_used;
    if(newMemBlock <= m_used)
    {
        ptr->prev = newMemBlock;
        newMemBlock->next = ptr;
        m_used = newMemBlock;
        return (void*)((char*)newMemBlock + sizeof(MemBlock));
    }

    MemBlock* previous = nullptr, * current = ptr;
    while(current<newMemBlock && current!= nullptr)
    {
        previous = current;
        current = current->next;
    }
    if(current != nullptr)
    {
        previous->next = newMemBlock;
        newMemBlock->next = current;
        newMemBlock->prev = previous;
        current->prev = newMemBlock;
        return (void*)((char*)newMemBlock + sizeof(MemBlock));
    }
    previous->next = newMemBlock;
    newMemBlock->prev = previous;
    return (void*)((char*)newMemBlock + sizeof(MemBlock));
}

MemBlock* MemoryAllocator::get_current_block(void* block_ptr)
{
    MemBlock* current;
    current = (MemBlock*)((unsigned  char*)block_ptr -sizeof(MemBlock));
    if(current == nullptr)
    {
        printString("ERROR wrong argument mem_free \n");
        return nullptr;
    }
    return current;
}

void MemoryAllocator::merge_blocks(MemBlock* cur)
{
    MemBlock* nextCurrent = cur->next;
    MemBlock* prevCurrent = cur->prev;
    // next
    if(nextCurrent == nullptr || nextCurrent->isUsed)
        return;

    cur->size += nextCurrent->size + sizeof(MemBlock);
    cur->next = cur->next->next;
    if(cur->next != nullptr)
        cur->next->prev = cur;

    // prev
    if(prevCurrent == nullptr || prevCurrent->isUsed)
        return;

    prevCurrent->size +=cur->size + sizeof (MemBlock);
    cur->prev->next = cur->next;
    if(cur->next != nullptr)
    {
        cur->next->prev = cur->prev;
    }
    return;
}

void MemoryAllocator::remove_block(MemBlock* current)
{
    MemBlock* curr = m_used;

    if (curr == current)
    {
        m_used = curr->next;
        if (m_used != nullptr)
            m_used->prev = nullptr;
        curr = nullptr;
        return;
    }

    MemBlock* previous;
    for(previous = nullptr; curr != nullptr && curr != current; previous = curr, curr = curr->next);

    if (!curr)
    {
        return;
    }
    else
    {
        previous->next = curr->next;
        if (curr->next != nullptr)
            curr->next->prev = previous;
        curr = nullptr;
    }
}


int MemoryAllocator::mem_free(void* ptr)
{
    if(ptr == nullptr)
    {
        printString("ERROR: invalid argument in mem_free\n");
        return -1;
    }

    MemBlock* current = get_current_block(ptr);
    if(current == nullptr) return -1;

    current->isUsed = false;
    merge_blocks(current);
    remove_block(current);

    return 0;
}
