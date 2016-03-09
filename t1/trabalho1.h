#ifndef TRABALHO1_H_INCLUDED
#define TRABALHO1_H_INCLUDED

char** lerTxt();
void imprime (char** vetor, int cont);
int comparar(const void* a,const void* b);
char* lerLinha(FILE* arq, char* v);
int contar();
void html(char** vetor, int fim);

#endif // TRABALHO1_H_INCLUDED
