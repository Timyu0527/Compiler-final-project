# Compiler-final-project
本次專案實作C語言中單層if else的語法，邏輯的四則運算以及cout語法<br>
組員：余中棋、余威霆、何浩宇、陳貫唯<br>
**編譯指令**
```cmd
flex  ifelse.l
bison -d ifelse.y
gcc linkedlist.c ifelse.tab.c lex.yy.c -lfl
```
**範例如下**
```cpp
if(3 > 4 || 4 > 1){
    cout << "1dfasdfsadf"<< " " << "1";
    cout << "1" << endl;
    cout << "1" << endl;
    cout << "1" << endl;
}
else if((1 > 20) && (23 > 10)){
    cout << 3 << " ";
    cout << "     " << 3 << endl;
    cout << 3 << endl;
    cout << 3 << endl;
    cout << 3 << endl;
}
else if(3 == 3){
    cout << "4" << endl;
    cout << "4" << endl;
    cout << "4" << endl;
    cout << "4" << endl;
    cout << "4" << endl;
}
else{
    cout << "2" << endl;
    cout << "2" << endl;
    cout << "2" << endl;
    cout << "2" << endl;
    cout << "2" << endl;
}

```
 