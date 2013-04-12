#include "Markup/Markup.h"
#include <iostream>
#include <fstream>
#include <stack>

using namespace std;

//递归解析xml
void Parse(const string& strDoc, int iDeep);

int main(int argc, char *argv[])
{
    string strDoc = "";
    CMarkup parser;
    if(parser.Load("test.xml"))
    {
        parser.FindElem();
        Parse(parser.GetDoc(), 0);
    }
	return 0;
}

//递归解析xml
void Parse(const string& strDoc, int iDeep)
{
    CMarkup parser;
    parser.SetDoc(strDoc);
    
    while(parser.FindChildElem())
    {
        Parse(parser.GetChildSubDoc(), iDeep + 1);
    }/*递归解析字节点*/
    
    //复位当前位置为文档起始位置
    parser.ResetPos();
    for (int i = 0; i < iDeep; ++i)
    {
        cout << "    ";
    }
    
    //定位到当前节点
    parser.FindElem();
    //获取节点名称
    cout << parser.GetTagName();
    //获取下一行的注释，如果存在注释，输出注释
    parser.IntoElem();
    if (parser.MNT_COMMENT == parser.FindNode(parser.MNT_EXCLUDE_WHITESPACE))
    {
        cout << " : " << parser.GetChildData();
    }
    cout << endl;
	parser.OutOfElem();
}

