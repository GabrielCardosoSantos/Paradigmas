#include <stdio.h>
#include <stdlib.h>

#include "trabalho1.c"


int main(){
    char** vetor;
    vetor = lerTxt();
    int cont;
    cont = contar();

    imprime(vetor, cont);
    printf ("\n");
    qsort(&vetor[0], cont, sizeof(char*), comparar);
    imprime(vetor, cont);

    html(vetor, cont);
    return 0;
}
