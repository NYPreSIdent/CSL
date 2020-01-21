#include <stdio.h>
#include <stdlib.h>
int max(int a ,int b)
{
if(a>=b)
{
return a;
}
else
{
return b;
}
}
int main(int argc, const char *argv[])
{
int m,n,result;
printf("输入两个数如 4,5 ：\n");
scanf("%d,%d",&m,&n);
result = max(m,n);
printf("this is max = %d\n",result);
return 0;
} 