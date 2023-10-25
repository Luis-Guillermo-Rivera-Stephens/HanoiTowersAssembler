#include <stdio.h>
#include <stdlib.h>

void moverDisco(short *origen, short *destino);
void printTorres(short *torreOrigen, short *torreAuxiliar, short *torreDestino, int numDisc);
void hanoi(int n, short *origen, short *destino, short *auxiliar, int a);
void setTorre(short *origen, int numDisc);
int scanint(int *v);


int main(){
    int n;
    printf("cuantos discos quieres usar?\n>");
    scanint(&n);

    short *torreOrigen = calloc(n,sizeof(short));
    short *torreAuxiliar = calloc(n,sizeof(short));
    short *torreDestino = calloc(n,sizeof(short));

    setTorre(torreOrigen, n);
    printTorres(torreOrigen, torreAuxiliar, torreDestino, n);

    hanoi(n, torreOrigen, torreDestino, torreAuxiliar, n);


    return 0;
}

int scanint(int *v){
    scanf("%d", v);
}

void setTorre(short *origen, int numDisc){
    for (int i = 0; i<numDisc; i++){
        origen[i] = i+1;
    }
}

void hanoi(int n, short *origen, short *destino, short *auxiliar, int a) {
    if(n==1){ 
    moverDisco(origen, auxiliar);
        return ;
    }
    hanoi(n-1,origen,destino,auxiliar, a);
    moverDisco(origen, auxiliar);
    printTorres(origen, destino, auxiliar, a);
    hanoi(n-1,destino,auxiliar,destino, a);
}

void printTorres(short *torreOrigen, short *torreAuxiliar, short *torreDestino, int numDisc){
    int i;
    printf("ORIGEN\n");
    for (i=0; i<numDisc; i++) 
        printf("%d\t", torreOrigen[i]);
    printf("\n\n");

    printf("AUXILIAR\n");
    for (i=0; i<numDisc; i++) 
        printf("%d\t", torreAuxiliar[i]);
    printf("\n\n");
    printf("DESTINO\n");
    for (i=0; i<numDisc; i++)
        printf("%d\t", torreDestino[i]);
    printf("\n\n___________________________________________________________\n\n");
}

void moverDisco(short *origen, short *destino) {
    
    int i = 0, j = 0;
    while (origen[i] == 0) {
        i++;
    }

    while (destino[j] != 0) {
        j++;
    }

    destino[j] = origen[i];
    origen[i] = 0;
}