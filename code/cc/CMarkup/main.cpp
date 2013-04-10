#include "Markup/Markup.h"
#include <iostream>
#include <fstream>

using namespace std;

//从文件中读取出xml字符串
bool ReadFile(string& strDoc, const char* szFileName);
//递归输出节点名称
void PrintNode(const string& strDoc, int iDeep);

int main(int argc, char *argv[])
{

    string strDoc = "";

    if(!ReadFile(strDoc, "test.xml"))
    {
        cerr << "open file failed!" << endl;
        return -1;
    }

    PrintNode(strDoc, 0);

	return 0;
}

bool ReadFile(string& strDoc, const char* szFileName)
{
    ifstream fs(szFileName);
    string strLine("");
    strDoc="";

    if (fs.is_open())
    {
        while(getline(fs, strLine))
        {
            strDoc += strLine;
        }//while getline successfull, append it to strDoc

        return true;
    }/*if open file succesfull*/

    return false;
}

void PrintNode(const string& strDoc, int iDeep)
{
    CMarkup parse;
    parse.SetDoc(strDoc);

    for (int i = 0; i < iDeep; ++i)
    {
        cout << "    ";
    }
    parse.FindElem();
    cout << parse.GetTagName() << endl;

    while(parse.FindChildElem())
    {
        parse.IntoElem();
        PrintNode(parse.GetSubDoc(), iDeep + 1);
        parse.OutOfElem();
    }
}
