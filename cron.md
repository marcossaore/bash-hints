## Cron

```bash	
    crontab -e
    * * * * * /cron_example.sh >> arquivo_saida.txt
```

`* * * * *` - execute every minute
`0 0 * * *` - execute every day at midnight
`0 0 1 * *` - execute every month at midnight on the first day
`*/15 * * * * *` -  execute every 15 seconds
`*/5 * * * *` - execute every 5 minutes
