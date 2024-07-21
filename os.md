## Comando Top

PID: número do processo

```bash
    top
```

* u: filtrar por usuário
* f: Explain fields 
* q: sair

## Comando Ps

```bash
    ps # process status
    ps aux # process status detailed
    ps aux | grep java # search (but includes the search in ps aux too, to remove search from the results, the example below)
    ps aux | grep -v grep | grep java # search and exclude grep
    pgrep java # returns the PID of the process
    pgrep NonExistentBin &> /dev/null # even the NonExistentBin does not exist, it will not return an error
    ps -e -o pid,%mem,%cpu --sort=-%mem # sort by memory usage
```


```bash
    ps -e -o pid,%mem,%cpu --sort=-%mem | head -n 10 # catch the top 10 processes with the highest memory usage
    ps aux --sort=-%cpu # catch processes with the highest cpu usage without filtering
    ps -e -o pid,%mem,%cpu,time,command --sort=%mem | head -n 30 # find the top 30 processes with the highest memory usage and more info
```