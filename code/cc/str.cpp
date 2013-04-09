#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main()
{
	
	string str("hello, github");
	cout << str << endl;
	cout << str.substr(7, 13) << endl;

	vector<string> vs;
	vs.push_back("hello");	
	vs.push_back("github");	
	vs.push_back(".");
	for (size_t i = 0; i < vs.size(); ++i)
	{
		cout << vs[i] << endl;
	}

	return 0;
}
