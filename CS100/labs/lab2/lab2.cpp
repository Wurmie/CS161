//wlee030
//yli066
#include <iostream>
#include <unistd.h>
#include <time.h>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>

void makeFork(int random)
{
        int pid = fork();
        std::string charList[4] = {"A","B","C","D"};
        //srand(time(NULL));
        //int randTime = rand()%4;

        if(pid == -1)
        {
                perror("fork");
                exit(1);
        }
        else if(pid == 0)//child process
        {

                for(int i = 0;i < 10000;i++)
                        std::cout << charList[random]<< " ";
                exit(1);
        }
        else if(pid > 0)//parent process
        {
                std::cout << "\n\nPID = "<<pid<<std::endl;
                if(-1 == wait(0))
                {
                        perror("There was an error with wait().");
                        exit(1);
                }
        }
}
int main()
{
        srand(time(NULL));
        makeFork(rand()%4);
        makeFork(rand()%4);
        makeFork(rand()%4);
        makeFork(rand()%4);
        return 0;
}

