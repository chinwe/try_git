#include <iostream>

using namespace std;

template<int n>
struct Fib
{
    enum { value = Fib<n-1>::value + Fib<n-2>::value };
};

template<>
struct Fib<1>
{
    enum { value = 1};
};

template<>
struct Fib<0>
{
    enum { value = 0};
};

int main()
{
    cout<< Fib<20>::value <<endl;

    return 0;
}
