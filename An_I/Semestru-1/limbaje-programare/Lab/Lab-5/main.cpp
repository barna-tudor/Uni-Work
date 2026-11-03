#include <climits>
#include <cmath>
#include <iostream>
#include <math.h>
using namespace std;

// probleme de 10
void pr_1() {
    int n, k, storage;
    cin >> k;
    cin >> n;
    int count = 0;
    for (int i = 0; i < n; ++i) {
        cin >> storage;
        if (storage == k) count++;
    }
    if (count == 0) cout << "nu exista" << endl;
    else cout << count << endl;
}

void pr_2() {
    int a, b, saved_1 = INT_MIN, saved_2 = INT_MIN;
    bool flag = true;
    cin >> a >> b;
    do {
        if (a >= 0 || b >= 0) {
            saved_1 = a;
            saved_2 = b;
            a = b;
            cin >> b;
        }
        flag = !(a < 0 && b < 0);
    } while (flag);
    if (saved_1 == INT_MIN && saved_2 == INT_MIN) cout << "nu exista" << endl;
    else cout << saved_1 << " " << saved_2 << endl;
}

void pr_3() {
    int a = 0, mx_1 = 0, mx_2 = 0;
    cin >> a;
    mx_1 = a;
    mx_2 = a;
    while (a != 0) {
        if (a > mx_2) {
            mx_1 = mx_2;
            mx_2 = a;
        }
    }
    cout << mx_1 << endl;
    cout << mx_2 << endl;
}

void pr_4() {
    int a = 0, last, semn = 0;
    cin >> a;
    while (a != 0) {
        last = a;
        cin >> a;
        if (a != 0) {
            if (a > last && semn == -1 ||
                a < last && semn == 1 ||
                a == last) {
                semn = 0;
                break;
            }
            if (a > last) semn = 1;
            if (a < last) semn = -1;
        }
    }
    switch (semn) {
        case -1:
            cout << "decrescator" << endl;
            break;
        case 1:
            cout << "crescator" << endl;
            break;
        case 0:
            cout << "neordonat";
    }
}

// probleme de 20
void pr_20_1() {
    int L;
    cin >> L;
    int count = 0;
    int taieturi_necesare = 1;
    while (L >= 1) {
        count += taieturi_necesare;
        taieturi_necesare *= 2;
        L /= 2;
    }
    cout << count << endl;
}

double EcuatieGradI(int b, int c) {
    if (b != 0) return (-b) / (c * 1.0);
    if (c == 0) return numeric_limits<double>::infinity();
    if (c != 0) return -numeric_limits<double>::infinity();
}

void pr_20_2() {
    int a, b, c;
    double x1, x2;
    cin >> a >> b >> c;
    // grad 2
    if (a != 0) {
        double delta = b * b - 4 * a * c;
        if (delta < 0) {
            cout << "nu exista" << endl;
        } else {
            x1 = (-b + sqrt(delta)) / (2 * a);
            x2 = (-b - sqrt(delta)) / (2 * a);
        }
        cout << x1 << " " << x2 << endl;
    }
    // grad 1
    if (a == 0) {
        double result = EcuatieGradI(b, c);
        if (result == numeric_limits<double>::infinity()) cout << "X apartine R" << endl;
        else if (result == -numeric_limits<double>::infinity()) cout << "Nu exista solutii";
        else cout << result << endl;
    }
}

// WIP
void pr_20_3() {
    int n;
    cin >> n;
    int current = -1;
    if (n < 3) {
        cout << "nu exista" << endl;
        return;
    }
    int stang = -1, drept = -1, potential = -1;
    for (int i = 0; i < n; ++i) {
        stang = current;
        current = drept;
        cin >> drept;
        if (true) {
        }
    }
}

void pr_20_4() {
    int n;
    cin >> n;
    long long prod = 1;
    int k = 1;
    long long next;
    while (prod <= n) {
        next = prod * (k + 1);
        if (abs(n - prod) < abs(n - next)) {
            break;
        }
        prod = next;
        k++;
    }
    cout << k << endl;
}

int main() {
    pr_20_1();
}
