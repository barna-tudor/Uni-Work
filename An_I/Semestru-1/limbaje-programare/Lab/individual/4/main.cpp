#include <iostream>
#include <fstream>
using namespace std;

void ex_1(int &n, int a[]) {
    if (n <= 0) {
        return;
    }
    int min = a[0];
    for (int i = 1; i < n; i++) {
        if (min > a[i]) {
            min = a[i];
        }
    }
    for (int i = 0; i < n; i++) {
        if (a[i] == min) {
            for (int j = i; j < n - 1; j++) {
                a[j] = a[j + 1];
            }
            n--;
        }
    }
}

struct Patrimoniu {
    char denumireObiect[100];
    int an;
    int pret;
};

long long ex_2(Patrimoniu p[], int nrObiecte) {
    long long sum = 0;
    for (int i = 0; i < nrObiecte; i++) {
        if (p[i].an >= 1901 && p[i].an <= 2000) {
            sum += p[i].pret;
        }
    }
    return sum;
}

void afiseaza(int a[100][100], int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            cout << a[i][j] << " ";
        }
        cout << endl;
    }
}

void genereaza(int a[100][100], int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (i == 0 || j == 0 || i == size - 1 || j == size - 1) {
                a[i][j] = 1;
            } else {
                a[i][j] = 0;
            }
        }
    }
}

char *ex_4(char *str) {
    int i = 0;
    while (str[i] != '\0') {
        i++;
    }
    char *res = new char[i + 1];
    res[i] = '\0';
    for (int j = 0; j < i; j++) {
        *(res + j) = *(str + i - j - 1);
    }
    return res;
}

int main() {
    //ex 1
    int n = 12;
    int *a = new int[]{0, 1, 23, 4, 5, 0, 0, 1, 0, 0, 1, 0};
    ex_1(n, a);
    ofstream fout("examen.txt");
    for (int i = 0; i < n; i++) {
        fout << a[i] << ", ";
    }
    fout.close();
    delete[] a;

    //ex 2
    Patrimoniu p[100];
    int nrObiecte = 5;
    for (int i = 0; i < nrObiecte; i++) {
        cout << "denumire obiect " << i + 1 << endl;
        cin >> p[i].denumireObiect;

        cout << "an " << i << endl;
        cin >> p[i].an;

        cout << "denumire obiect " << i + 1 << endl;
        cin >> p[i].pret;
    }
    long long ex_2_sum = ex_2(p, nrObiecte);
    cout << ex_2_sum << endl;

    //ex3
    int ex_3_mat[100][100];
    int ex_3_size = 3;
    genereaza(ex_3_mat, ex_3_size);
    afiseaza(ex_3_mat, ex_3_size);

    //ex 4
    char test_4[100] = "Testing";
    char *rez = ex_4(test_4);
    cout << rez << endl;

    return 0;
}
