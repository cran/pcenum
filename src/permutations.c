#include <R.h>

/* Place la permutation suivante dans nextA */
void goNextPermut(int* a, int* n, int* k, int* nextA)
{
  int i, kounter=0, pivot, replace, left, right, aux;
  
  /* (deep) Copy a to nextA */
  for (i = 0; i < *n; i++) nextA[i] = a[i];
    
  while (kounter++ < *k)
  {
    /* Look for pivot:
       index of first non-inversion (nextA[i-1] < nextA[i]) */
    i = *n - 1;
    while (i > 0 && nextA[i-1] > nextA[i]) i--;
    pivot = i-1;
    if (pivot < 0) return; /* last permutation has been reached */
    
    /* Look for the element to replace the pivot:
       first index which verify nextA[index] < nextA[pivot] */
    i = *n - 1;
    while (nextA[i] < nextA[pivot]) i--;
    replace = i;
    
    /* Swap nextA[pivot] <--> nextA[replace] */
    aux = nextA[pivot];
    nextA[pivot] = nextA[replace];
    nextA[replace] = aux;
    
    /* Revert sub-array at the right of the pivot */
    left = pivot + 1; right = *n - 1 ;
    while(left<right)
    {
      aux = nextA[left];
      nextA[left] = nextA[right];
      nextA[right] = aux;
      left++; right--;
    }
  }
}
