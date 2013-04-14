#include <iostream>

using std::cout;
using std::endl;

/*计算父节点和左右字节点下标的宏定义*/
#define PARENT(i) (i >> 1)
#define LEFT(i) (i << 1)
#define RIGHT(i) (LEFT(i) + 1)

#define SIZE 11
/*下标从0开始，定义数组能够使用从1-10的下标，0空着不用*/
int A[SIZE] = {0, 4, 1, 3, 2, 16, 9, 10, 14, 8, 7};
		
/*交换两个元素的方法*/
void swap(int& i, int& j)
{
	int t = i;
	i = j;
	j = t;
}

/*打印数组元素*/
void print(int* arr, int n)
{
	cout << "[ ";	
	for(int i = 1; i < n; ++i)
	{
			cout << arr[i] << " ";
	}
	cout << "]" << endl;
}

/*保证当前节点值大于任意字节点的方法*/
void max_heapify(int* arr, int n, int i)
{
	int l = LEFT(i);
	int r = RIGHT(i);
	int heap_size = n - 1;
	int largest = i;

	if (l <= heap_size && arr[l] > arr[i])
	{
		largest = l;
	}/*左节点大于节点值*/
	
	if (r <= heap_size && arr[r] > arr[largest])
	{
		largest = r;
	}/*右节点值最大*/
	
	if (i != largest)
	{
	    /*把大的数值交换到当前节点*/
		swap(arr[i], arr[largest]);
		/*继续调整交换节点*/
		max_heapify(arr, n, largest);
	}/*最大值不是当前节点，而是字节点*/
	
	print(arr, SIZE);
}

/*创建最大堆的方法*/
void build_max_heap(int* arr, int n)
{
	int heap_size = n - 1;

    /*［heap_size / 2,....,1]表示的是包含字节点的节点，从下向上依次调整*/
	for (int i = heap_size / 2; i >= 1; --i)
	{
	    max_heapify(arr, n, i);
	}
}

/*堆排序算法*/
void heap_sort(int* arr, int n)
{
    /*创建最大堆*/
	build_max_heap(arr, n);
	
	/*由于根节点的值总是最小的，所以只需要把根值存储在数组尾部，然后减少堆大小，并保持根值*/
	for (int i = n - 1 ; i >= 2; --i)
	{
		swap(arr[1], arr[i]);
		max_heapify(arr, i, 1);
	}
}

int main()
{		
    heap_sort(A, SIZE);
    return 0;
}
