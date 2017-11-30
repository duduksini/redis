# duduksini-redis
This is a redis .rdb seed/backup for [boardgame-api](https://github.com/duduksini/boardgame-api), [collection-api](https://github.com/duduksini/collection-api), and [user-api](https://github.com/duduksini/user-api). Everything shares database 0 under different namespaces, for cost reason.

## Running locally
### Install docker and share your drive. Then run:
```
docker run -d -v D:\\Projects\\Github\\duduksini\\redis\\config:/config -v D:\\Projects\\Github\\duduksini\\redis\\data:/data -p 6379:6379 --name duduksini-redis redis:3.2.4
```
### It should have thousands of keys:
```
docker exec -it duduksini-redis redis-cli keys '*'
```

## Deploying to AWS ElastiCache
1. Make sure aws cli is configured with access and secret key
2. Create an [s3 bucket for the seed .rdb](https://github.com/duduksini/s3)
3. Create [VPCs and export the ids as cloudformation output](https://github.com/duduksini/vpc)
4. Run `deploy.sh` inside `/aws` folder
