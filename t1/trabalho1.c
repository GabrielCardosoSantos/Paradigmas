#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "t1.h"

#define MAX 50
void html(char** vetor, int fim){
    FILE* gravar;
    int i = 0;
    gravar = fopen("vencedores.html", "w");

    if (gravar != NULL){
        if (vetor != NULL){
            fprintf(gravar, "<body>Lista de vencedores</body>\n");
            for (i = 0; i < fim; i++){
                fprintf(gravar, "<li> %s\n </li>", vetor[i]);
            }
            fprintf(gravar, "</ul>");
        }
    }
    fclose(gravar);
    system("vencedores.html");
}


int contar(){
    FILE* ler;
    char linha[MAX];
    int i = 0;

    ler = fopen("nomes.txt", "r");
    while (!feof(ler)){
        fgets(linha, MAX, ler);
        if (linha[0] == 'R' || linha[0] == 'r')
            i++;
    }
    return i;
}

char* lerLinha(FILE* arq, char* v){
    char pegar;
    int i = 0;
    pegar = fgetc(arq);
    while (pegar != '\n' && pegar != EOF){
        v[i] = pegar;
        i++;
        pegar = fgetc(arq);
    }
    v[i] = '\0';
    return v;
}

char** lerTxt (){
    FILE* arq;
    int i = 0, cont;
    char* v, **vetor;
    char pegar;

    cont = contar();
    v = (char*)malloc(sizeof(char));
    vetor = (char**)malloc(sizeof(char*)* cont);
    for (i = 0; i <= cont; i++){
        vetor[i] = (char*)malloc(sizeof(char)* MAX);
    }

    arq = fopen("nomes1.txt", "r");

    i = 0;
    while (!feof(arq)){
        v = lerLinha(arq, v);
        if (v[0] == 'R' || v[0] == 'r'){
            strcpy(vetor[i], v);
            i++;
        }
    }

    return vetor;
}

int comparar(const void* a,const void* b){
    return strcmp(*(char*const*) a, *(char*const*) b);
}

void imprime (char** vetor, int cont){
    int i;
    for (i = 0; i < cont; i++){
        printf ("%s\n", vetor[i]);
    }
}
