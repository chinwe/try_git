#include <stdio.h>

//首字母大写
void upper(char* str)
{
	if(NULL != str)
	{
		str[0] &= 0xDF;    //ascii大写 &1101111
	}
}

int main(void)
{
	char sz[] = "hello";
	printf("%s\n", sz);
	upper(sz);
	printf("%s\n", sz);
	return 0;
}
