#include <iostream>
#include <library.hpp>

int main(int argc, char *argv[]) {
    std::cout << "Hello from docker\n";
    lib::test_lib();
    return 0;
}
