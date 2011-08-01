#include <R.h>

/* Put the next permutation in nextA */
void goNextCombi(int* a, int* n, int* k, int* nextA)
{
  int i, kounter=0, pivot, left, right, aux;
  
  /* (deep) Copy a to nextA */
  for(i = 0; i < *n; i++) nextA[i] = a[i];
  
  while (kounter++ < *k)
  {
    /* Look for pivot:
       index of first pattern (0 1) to be swapped into (1 0) */
    i = *n - 1;  
    while (i > 0 && (nextA[i-1] != 0 || nextA[i] != 1)) i--;  
    pivot = i - 1;
    if (pivot < 0) return; /* last combination has been reached */
    
    /* exchange (0 1) --> (1 0),
       where the first '0' is at 'pivot' index in nextA */
    nextA[pivot] = 1; nextA[pivot+1] = 0;
    
    /* Revert sub-array at the right of the pivot */
    left = pivot + 2; right = *n - 1;  
    while (left < right)
    {
      aux = nextA[left];
      nextA[left] = nextA[right];
      nextA[right] = aux;
      left++; right-- ;
    }
  }
}

/* Transform 0 1 0 1 1 0... into 1 3 4... for easy human reading */
void translate(int* a, int* n, int* humanA)
{
  int i, j = 0;
  for (i = 0; i < *n; i++)
  {
    if (a[i]) humanA[j++] = i + 1;
  }
}
