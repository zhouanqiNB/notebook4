#include<iostream>
#include <cstring>
using namespace std;
char a[11];
char b[9];
int number;

void dec2dw(){
	for (int i = 0; i < strlen(a); ++i) number=number*10+(a[i]-'0');
}

void dw2hex(){
	for (int i = 0; i < 8 ; ++i){	
		int tmp=number>>((7-i)*4);

		if(tmp<10) 	b[i]=char(tmp+'0');
		else 		b[i]=char(tmp-10+'A');
	}
}

int main(){
	for (int i = 0; i < 11; ++i) a[i]='\0';
	for (int i = 0; i < 9; ++i) b[i]='\0';
	number=0;
	cin>>a;

	dec2dw();
	dw2hex();

	cout<<b<<endl;
	return 0;
}