#include <stdio.h>
#include "myCString.h"
#include <string.h>
//muy003
//wlee030
//cfan002
int main()
{
        char newString[100] = "rawr rawr hello t-rex";
        char newString1[100] = "rawr rawr hello  A YELLOW CAKE with FROSTING";
        char a[100] = "hello";
        char b[100] = "hello";
        char newStringo[100] = "rawr rawr hello t-rex";
        char newString1o[100] = "rawr rawr hello  A YELLOW CAKE with FROSTING";
        char ao[100] = "hello";
        char bo[100] = "hello";
        char* temp;

//test our string length
        printf("string length");
        printf("\n");
        //ours
        printf("%d",strlength(newString));
        printf("\n");
        //theirs
        printf("%d",strlen(newString));
        printf("\n");
//testing our string  copy
        printf("string copy");
        printf("\n");
        //ours
        temp = stringCopy(newString1,newString);
        printf(temp);
        printf("\n");
        //original 
        strcpy(newString1o,newStringo);
        printf(newString1o);
        printf("\n");
//testing our string n copy
        printf("string n copy");
        printf("\n");
        //ours
        temp = stringnCopy(newString,newString1,5);
        printf(temp);
        printf("\n");
        //original 
        printf(strncpy(newStringo,newString1o,5));
        printf("\n");
//testing our string cat
        printf("string cat");
        printf("\n");
        //ours
        temp = stringcat(newString,newString1);
        printf(temp);
	printf("\n");
        // original 
        printf(strcat(newStringo,newString1o));
        printf("\n");
//testing our string n cat
        printf("string n cat");
        printf("\n");
        //ours
        strnCAT(newString,newString1,5);
        printf(newString);
        printf("\n");
        //original
        strncat(newStringo,newString1o,5);
        printf(newStringo);
        printf("\n");
//testing our strCmp
        printf("strCmp");
        printf("\n");
        //ours
        printf("%s",strCmp(a, b));
        printf("\n");
        //original
        printf("%s",strcmp(ao,bo));
        printf("\n");

// testing our string char
        printf("string char");
        printf("\n");
//ours
        printf("%d",stringChar(a,'h'));
        printf("\n");
        //original 
        printf("%d",strchr(ao,'h'));
        printf("\n");
// testing our string str
        printf("string str");
        printf("\n");
//ours
        char* pch= stringStr(newString,a);
        printf(pch,99);
        printf("\n");
        //original
        char* pcho=strstr(newStringo,ao);
        printf(pcho,99);
        printf("\n");
//testing string length 
        //ours
        printf( "string length: ");
        printf("%d",strlength(newString));
        printf("\n");
        //original
        printf("Original: ");
        printf("%d",strlen(newStringo));
        printf("\n");

        return 0;
}
             
