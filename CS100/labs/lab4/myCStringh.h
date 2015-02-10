nt strlength(char* stringChar)
{
        int count = 0;
        char i = stringChar[0];
        int x = 0;
        while(i != '\0')
        {
                count++;
                x++;
                i = stringChar[x];
        }
        return count;
}

char* stringCopy(char* stringChar,char* stringChar1)
{
        int i;
        for(i = 0;i < strlength(stringChar1);i++)
        {
                stringChar[i] = stringChar1[i];
        }
        stringChar[i] = '\0';
        return stringChar;
}

char* stringnCopy(char* stringChar,char* stringChar1,int x)
{
        for(int i = 0; i < x;i++)
        {
                stringChar[i] = stringChar1[i];
        }
        return stringChar;
}

char* stringcat(char* stringChar,char* stringChar1)
{
        int j;
        int count = 0;
        for(j = 0;stringChar[j];j++)
                count++;

        int i;
        for(i = 0;stringChar1[i];i++)
        {
                stringChar[count+i] = stringChar1[i];
        }
        stringChar[count+i] = '\0';
        return stringChar;
}
void strnCAT(char* stringChar,char* stringChar1,int x)
{
        int firstLen = strlength(stringChar);
        int seconLen = strlength(stringChar1);
        int s = 0;
        int i;
        for(i = firstLen;i < seconLen+firstLen && s < x;i++)
        {
                stringChar[i] = stringChar1[s];
                s++;
        }
        stringChar[i] = '\0';
}

int strCmp(char* x, char* y){
        int i = 0;

        while(x[i] == y[i]){
                if(x[i]=='\0')
                return 0;
                i++;
        }


        if(x[i]>y[i])
                return 1;
        else if(x[i]<y[i])
         return -1;



}

int stringChar(char* x,int y)
{
        const char ch = y;

        for(int i = 0;x[i] != '\0';i++)
        {
                if(x[i] == ch)
                        return i;
                if(x[i] == '\0')
                        return -1;
        }
        return -1;
}
char* stringStr(char* x,char* y)
{
        char* ret;
        int destlen=strlength(x);
        int srclen=strlength(y);
        for(int i=0;i<destlen;i++){
                if(x[i]==y[0]){
                        for(int j=i,r=0;i-j<srclen;r++,j++){
                                if (x[j]!=y[r]){
                                        break;
                                }
                        }
                        ret=&x[i];
                        break;
                }
        }

return ret;
}
                                                                                                                                                                                           116,1         Bot

