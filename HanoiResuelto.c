#include <stdio.h>
#include <stdlib.h>

void moverDisco(short *origen, short *destino, int disc);
void printTorres(short *torreOrigen, short *torreAuxiliar, short *torreDestino, int numDisc);
void hanoi(int n, short *origen, short *auxiliar ,short *destino ,short **torres, int a);
void setTorre(short *origen, int numDisc);
void setTorre2(short *origen, int numDisc);
int scanint(int *v);


int main(){
    int n;
    printf("cuantos discos quieres usar?\n>");
    scanint(&n);

    short torreOrigen[n];
    short torreAuxiliar[n];
    short torreDestino[n];

    short *torres[3] = {torreOrigen, torreDestino, torreAuxiliar};

    setTorre(torreOrigen, n);
    setTorre2(torreAuxiliar,n);
    setTorre2(torreDestino,n);

    printTorres(torreOrigen, torreAuxiliar, torreDestino, n);

    hanoi(n, torreOrigen, torreDestino, torreAuxiliar, torres, n);


    return 0;
}

int scanint(int *v){
    scanf("%d", v);
}

void setTorre(short *origen, int numDisc){
    for (int i = 0; i<numDisc; i++){
        origen[i] = numDisc- i;
    }
}

void setTorre2(short *origen, int numDisc){
    for (int i = 0; i<numDisc; i++){
        origen[i] = 0;
    }
}




void hanoi(int n, short *origen, short *auxiliar, short *destino, short **torres, int a) 
{
    printf("\n______\nn: %d\n________\n", n);
    if(n==1){ 
        moverDisco(origen, auxiliar, a);
        printTorres(torres[0], torres[1], torres[2] ,a);
        system("pause");
        return ;
    }
    
    hanoi(n-1, origen, destino, auxiliar, torres, a);

    printf("\n______\nn: %d\n________\n", n);
    moverDisco(origen, auxiliar, a);
    printTorres(torres[0], torres[1], torres[2] ,a);
    system("pause");

    hanoi(n-1, destino, auxiliar, origen, torres, a);
}
void printTorres(short *torreOrigen, short *torreAuxiliar, short *torreDestino, int numDisc){
    int i;
    printf("ORIGEN\n");
    for (i=0; i<numDisc; i++) 
        printf("%d\t", torreOrigen[i]);
    printf("\n\n");

    printf("DESTINO\n");
    for (i=0; i<numDisc; i++) 
        printf("%d\t", torreAuxiliar[i]);
    printf("\n\n");
    printf("AUXILIAR\n");
    for (i=0; i<numDisc; i++)
        printf("%d\t", torreDestino[i]);
    printf("\n\n___________________________________________________________\n\n");
}

void moverDisco(short *origen, short *destino, int disc) {
    
    int i=disc -1, j = 0;
    while (origen[i] == 0 && disc >=0) {
        i--;
    }

    while (destino[j] != 0) {
        j++;
    }

    destino[j] = origen[i];
    origen[i] = 0;
}