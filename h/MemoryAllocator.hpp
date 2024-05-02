#ifndef _MEMORY_ALLOCATOR_HPP_
#define _MEMORY_ALLOCATOR_HPP_

#include "../lib/hw.h"

struct MemBlock
{
    size_t size;
    MemBlock* next;
    MemBlock* prev;
    bool isUsed;
    MemBlock();
    MemBlock(size_t sz);
};

struct MemBlockUsed
{
    size_t size;
    MemBlockUsed* next;
    void* addr;
    MemBlockUsed(size_t sz = 0) : size(sz), next(nullptr){}
};

class MemoryAllocator
{
public:
    static void mem_init();
    static void* mem_alloc(size_t size);
    static int mem_free(void* ptr);
    static void printString(char const *string);

private:
    static size_t calculate_size(size_t size);
    static MemBlock* find_best_fit(size_t size);
    static MemBlock* get_current_block(void* block_ptr);
    static void merge_blocks(MemBlock* cur);
    static void remove_block(MemBlock* current);

private:
    MemoryAllocator(){}
    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator& operator = (const MemoryAllocator&) = delete;

private:
    static MemBlock* m_head, *m_used;
    static MemBlockUsed* m_used_head, *m_used_tail;
};
#endif