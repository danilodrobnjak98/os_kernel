#include "../h/Initialization.hpp"
#include "../test/userMain.hpp"

int main()
{
    Initialization::Initialize();
    userMain();
    Initialization::Unitialize();
    return 0;
}
