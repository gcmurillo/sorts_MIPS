#include<stdio.h>

typedef enum { false, true } bool;

void quick(int *arr, int left, int right) {
	int l = left, r = right, p = left;
	
	while (l < r) {
		while (arr[l] <= arr[p] && l < right)
			l++;
		while (arr[r] >= arr[p] && r > left)
			r--;
		if (l >= r) {
			SWAP(arr[p], arr[r]);
			quick(arr, left, r - 1);
			quick(arr, r + 1, right);
			return;
		}
		SWAP(arr[l], arr[r]);
	}
}

void insertionsort(int number[25], int count){
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
       while (usado[index]==false);
         number[i] = temp[index];
         usado[index]=true;
      }
   }
}

void selectionsort(int array[25], int n){
   int c, d, position, swap;
   for (c = 0; c < (n - 1); c++)
  {
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
   int i, count, number[25], temp[25];

   printf("Programa para ordenar arreglos de maximo 25 elementos\n\nQuickSort\n");
   printf("How many elements are u going to enter?: ");
   scanf("%d",&count);

   while(count<1 || count>25){
      printf("Enter a valid number (1-25): ");
      scanf("%d",&count);
   }

   printf("Enter %d elements: ", count);
   for(i=0;i<count;i++)
      scanf("%d",&number[i]);

   quicksort(number,0,count-1);

   printf("Order of Sorted elements with QuickSort: ");
   for(i=0;i<count;i++)
      printf(" %d",number[i]);

   temp = number;
   desordenar(count, number, temp);

   insertionsort(number, count);

   printf("Order of Sorted elements with InsertionSort: ");
   for(i=0;i<count;i++)
      printf(" %d",number[i]);

   desordenar(count, number, temp);

   printf("Order of Sorted elements with SelectionSort: ");
   for(i=0;i<count;i++)
      printf(" %d",number[i]);

   return 0;
}