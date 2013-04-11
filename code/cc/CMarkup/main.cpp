#include "Markup/Markup.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <map>
#include <stack>

using namespace std;

/*节点定义*/
template<typename T>
struct tagNode
{
	T data;
	int iDeep;
	tagNode* parent;
	tagNode* nextSlib;
	vector<tagNode*> childs; 
	bool bVisit;	
};
typedef tagNode<string> Node;
typedef map<int, vector<Node*> >::iterator MapIt;
typedef vector<Node*>::iterator NodeIt;

/*按层次存储节点*/
typedef map<int, vector<Node*> > Tree;
Tree g_tree;

//从文件中读取出xml字符串
bool ReadFile(string& strDoc, const char* szFileName);
//递归输出节点名称
void PrintNode(const string& strDoc, int iDeep);
//新增节点
void NewNode(const string& strNode, int iDeep);
//清理内存
void Clean(Tree& tree);
//遍历树
void dfs(Node* pNode);
//访问节点
void visit(Node* pNode);

int main(int argc, char *argv[])
{

    string strDoc = "";

    if(!ReadFile(strDoc, "test.xml"))
    {
        cerr << "open file failed!" << endl;
        return -1;
    }

    PrintNode(strDoc, 0);

	//cout << "[Debug] main g_tree[0].size() " << g_tree[0].size() << endl;
	//cout << "[Debug] main g_tree[1].size() " << g_tree[1].size() << endl;
	//cout << "[Debug] main g_tree[2].size() " << g_tree[2].size() << endl;
	dfs(g_tree[0][0]);
	
	Clean(g_tree);

	return 0;
}


void dfs(Node* pNode)
{
	stack<Node*> nodeStack;
	nodeStack.push(pNode);

	while (!nodeStack.empty())
	{
		Node* pCurNode = nodeStack.top();
		nodeStack.pop();
		
		if (!pCurNode->childs.empty())
		{
			nodeStack.push(pCurNode);
	
			Node* pChildNode = pCurNode->childs[0];
			while (NULL != pChildNode)
			{
				if(!pChildNode->bVisit)
				{
					nodeStack.push(pChildNode);
					break;
				}/*查找到未访问的字节点，字节点入栈*/

				/*移动到下一个节点*/
				pChildNode = pChildNode->nextSlib;
			}

			if (NULL == pChildNode)
			{
				nodeStack.pop();
				visit(pCurNode);
			}/*所有字节点都访问了，父节点出栈*/
		}
		else
		{
			visit(pCurNode);
		}/*当前节点无字节点*/
	}
	
}

void visit(Node* pNode)
{
	int iDeep = pNode->iDeep;
	while (iDeep--)
	{
		cout << "\t";
	}
	cout << pNode->data << endl;
	pNode->bVisit = true;
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

	/*
    for (int i = 0; i < iDeep; ++i)
    {
        cout << "    ";
    }
    parse.FindElem();
    cout << parse.GetTagName() << endl;
	*/
	//cout << "[Debug] PrintNode " << parse.GetTagName() << endl;

	parse.FindElem();
	NewNode(parse.GetTagName(), iDeep);

    while(parse.FindChildElem())
    {
        parse.IntoElem();
        PrintNode(parse.GetSubDoc(), iDeep + 1);
        parse.OutOfElem();
    }
}

void NewNode(const string& strNode, int iDeep)
{
	Node* pNode = new Node;
	pNode->data = strNode;
	pNode->iDeep = iDeep;
	pNode->bVisit = false;
	pNode->nextSlib = NULL;

	//cout << "[Debug] NewNode " << pNode->data << endl;

	if(0 == iDeep)
	{
		pNode->parent = NULL;
	}
	else
	{
		int iParentDeep = iDeep - 1;
		vector<Node*> parentNodes = g_tree[iParentDeep];
		Node* pParentNode = parentNodes[parentNodes.size() - 1];
		pNode->parent = pParentNode;

		size_t iChild = pParentNode->childs.size();
		if (iChild > 0)
		{
			pParentNode->childs[iChild - 1]->nextSlib = pNode;
		}
		pParentNode->childs.push_back(pNode);
	}

	g_tree[iDeep].push_back(pNode);
}

void Clean(Tree& tree)
{
	for (MapIt it = tree.begin(); it != tree.end(); ++it)
	{
		for (size_t i = 0; i < it->second.size(); ++i)
		{
			delete (it->second)[i];
			(it->second)[i] = NULL;
		}
	}
}

