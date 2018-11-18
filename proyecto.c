#include <stdio.h>
#include <stdlib.h>

typedef enum {false, true} bool;

void insertionsort(int number[25], int count) {
   int i, j, temp;
   for(i=1;i<count;i++){
      temp=number[i];
      j=i-1;
      while((temp<number[j])&&(j>=0)){
         number[j+1]=number[j];
         j=j-1;
      }
      number[j+1]=temp;
   }
}

void desordenar(int count, int number[25], int temp[25]){
    bool usado[count];
    for (int i=0; i < count; i++)
       usado[i]=false;

    int index=0;
    for (int i=0; i < count; i++){
       do{
           index = (rand() % 44);
       }while (usado[index]==false);
        number[i] = temp[index];
        usado[index]=true;
    }
}

void selectionsort(int array[25], int n){
  int c, d, position, swap;
  for (c = 0; c < (n - 1); c++){
    position = c;
   
    for (d = c + 1; d < n; d++)
    {
      if (array[position] > array[d])
        position = d;
    }
    if (position != c)
    {
      swap = array[c];
      array[c] = array[position];
      array[position] = swap;
    }
  }
}

int main(){
  int i, temp[25];
  int number[25] = {34, 2, 19, 9, 1, 23, 45, 3, 44, 98, 123, 21, 45, 29, 56, 4, 21, 45, 89, 43, 3, 56, 66, 43, 123};

  printf("Programa para ordenar arreglos de maximo 25 elementos\n");

  insertionsort(number, 25);

  printf("\nOrder of Sorted elements with InsertionSort: ");
  for(i=0;i<25;i++)
    printf(" %d",number[i]);
  
  desordenar(25, number, temp);
  
  selectionsort(number, 25);

  printf("\nOrder of Sorted elements with SelectionSort: ");
  for(i=0;i<25;i++)
    printf(" %d",number[i]);

  printf("\n");
    
  return 0;

}
