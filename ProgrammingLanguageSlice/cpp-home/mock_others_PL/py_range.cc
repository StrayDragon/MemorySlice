#include<iostream>
using std::cout;

class range_iterator {
public:
    range_iterator(int value, int step): value(value), step(step) {}
    range_iterator& operator++() { value += step; return *this; }
    bool operator!=(const range_iterator& other) { return value < other.value; }
    int& operator*() { return value; }
private:
    int value, step;
};

class range {
public:
    range(int start, int stop, int step): start(start), stop(stop), step(step) {}
    range_iterator begin() { return range_iterator(start, step); }
    range_iterator end() { return range_iterator(stop, step); }
private:
    int start, stop, step;
};


int main() {
    int op, ed, step;
    std::cin >> op >> ed >> step;

    for (int i : range(op, ed, step)) {
        std::cout << i << std::endl;
    }
}
