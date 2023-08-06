#include <iostream>
#include "../lib/lib.hpp"

int main(int argc, char *argv[]) {
    std::cout << "Hello from docker\n";
    lib::test_lib();
    return 0;
}
