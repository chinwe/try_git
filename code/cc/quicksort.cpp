#include <vector>
#include <iostream>

using namespace std;

template<typename T>
void print(const T& l, const T& r)
{
	cout << "[ ";
	for (T t =l; t != r; ++t)
	{
		cout << *t << " ";
	}
	cout << "]" << endl;
}

int partion(vector<int>& vec, int left, int right)
{
	int i = left;
	int j = right;
	int X = vec[i];

	while (i < j)
	{
		while (i < j)
		{
			if (vec[j] < X)
			{
				vec[i] = vec[j];
				++i;
				break;
			}
			--j;
		}/*从后向前找一个比X小的数*/

		while(i < j)
		{
			if(vec[i] >= X)
			{
				vec[j] = vec[i];
				--j;
				break;
			}
			++i;
		}/*从前向后找一个比X大的数*/

	}/*重复以上步骤*/

	vec[i] = X; /*这时X左边的数字都不比X大，X右边的数字都不比X小，分区完成*/

	return i;
}

void swap(int& i, int& j)
{
	int t = i;
	i = j;
	j = t;
}

int partion1(vector<int>& vec, int left, int right)
{
	int index = left;
	int povit = vec[left];

	/*把基准值放在最后*/
	swap(vec[index], vec[right]);
	for (int i = left; i < right; ++i)
	{
		if (vec[i] < povit)
		{
			swap(vec[index], vec[i]);
			++index;		
		}/*如果元素比基准值小，把它交换到数组前面*/
	}
	/*把基准值交换到正确位置*/
	swap(vec[right], vec[index]);

	return index;
}

void quicksort(vector<int>& vec, int left, int right)
{
    cout << "before : ";
    print(vec.begin(), vec.end());
	
	int key = left;
	if (left < right)
	{
		key = partion1(vec, left, right);
		
		cout << "end    : ";
		print(vec.begin(), vec.end());

		quicksort(vec, left, key - 1);
		quicksort(vec, key + 1, right);
	}
}

int main()
{
	vector<int> vec;
	vec.push_back(5);
	vec.push_back(7);
	vec.push_back(2);
	vec.push_back(4);
	vec.push_back(54);
	vec.push_back(76);
	vec.push_back(53);
	vec.push_back(45);
	vec.push_back(435);
	vec.push_back(5444);

	quicksort(vec, 0, vec.size() - 1);
	return 0;
}
